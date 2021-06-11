module V1
    class CourseItemsController < ApplicationController
        before_action :retrieve_course, only: :index
        before_action :find_resource, only: %i[show update destroy]
        before_action :build_resource, only: :create

        def index
            render json: @course.course_items, each_serializer: V1::CourseItemSerializer
        end

        def show
            render json: @course_item, serializer: V1::CourseItemSerializer
        end

        def create
            if @course_item.save
                render json: @course_item, serializer: V1::CourseItemSerializer
            else
                render json: @course_item.errors, status: :unprocessable_entity
            end
        end

        def update
            if @course_item.update(permitted_attributes(@course_item))
                render json: @course_item, serializer: V1::CourseItemSerializer 
            else
                render json: @course_item.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @course_item.destroy!
            head :no_content
        end
      
        private

        def retrieve_course
            @course = policy_scope(Course).find(params[:course_id])
        end
    end
end