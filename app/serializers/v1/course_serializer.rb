module V1
    class CourseSerializer < ApplicationSerializer
        attributes :id, :name

        has_many :course_items
    end
end