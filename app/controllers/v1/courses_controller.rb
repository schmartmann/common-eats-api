module V1
    class CoursesController < ApplicationController
        before_action :retrieve_menu, only: :index
        before_action :find_resource, only: %i[show update destroy]
        before_action :build_resource, only: :create

        def index
            render json: @menu.courses, each_serializer: V1::CourseSerializer
        end

        def show
            render json: @course, serializer: V1::CourseSerializer
        end

        def create
            if @course.save
                render json: @course, serializer: V1::CourseSerializer
            else
                render json: @course.errors, status: :unprocessable_entity
            end
        end

        def update
            if @course.update(permitted_attributes(@course))
                render json: @course, serializer: V1::CourseSerializer 
            else
                render json: @course.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @course.destroy!
            head :no_content
        end
      
        private

        def retrieve_menu
            @menu = policy_scope(Menu).find(params[:menu_id])
        end
    end
end