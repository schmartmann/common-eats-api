module V1
    class CourseSerializer < ApplicationSerializer
        attributes :id, :name

        # has_many :courses
    end
end