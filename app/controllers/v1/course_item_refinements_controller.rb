module V1
    class CourseItemRefinementsController < ApplicationController
        before_action :retrieve_course_item, only: :index
        before_action :find_resource, only: %i[show update destroy]
        before_action :build_resource, only: :create

        def index
            render json: @course_item.course_item_refinements, each_serializer: V1::CourseItemRefinementSerializer
        end

        def show
            render json: @course_item_refinement, serializer: V1::CourseItemRefinementSerializer
        end

        def create
            if @course_item_refinement.save
                render json: @course_item_refinement, serializer: V1::CourseItemRefinementSerializer
            else
                render json: @course_item_refinement.errors, status: :unprocessable_entity
            end
        end

        def update
            if @course_item_refinement.update(permitted_attributes(@course_item_refinement))
                render json: @course_item_refinement, serializer: V1::CourseItemRefinementSerializer 
            else
                render json: @course_item_refinement.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @course_item_refinement.destroy!
            head :no_content
        end
      
        private

        def retrieve_course_item
            @course_item = policy_scope(CourseItem).find(params[:course_item_id])
        end
    end
end