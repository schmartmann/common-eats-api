module V1
    class MenuSerializer < ApplicationSerializer
        attributes :id, :name

        has_many :courses
    end
end