module V1
    class CourseItemSerializer < ApplicationSerializer
        attributes :id, :name, :description, :price

        has_many :course_item_refinements
    end
end