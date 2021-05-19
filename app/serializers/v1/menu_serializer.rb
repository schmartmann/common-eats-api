module V1
    class MenuSerializer < ApplicationSerializer
        attributes :id, :name

        has_many :courses
        has_many :operation_hours, as: :schedulable
    end
end