module V1
    class RestaurantsController < ApplicationController

        def index
            @restaurants = Restaurant.all 

            render json: @restaurants, each_serializer: V1::RestaurantSerializer 
        end
    end
end