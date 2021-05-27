module V1
    class CuisineWithRestaurantsSerializer < ApplicationSerializer
        attributes :id, :name, :restaurants

        def restaurants
            object.restaurants
        end
    end
end