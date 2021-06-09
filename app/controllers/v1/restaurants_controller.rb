module V1
    class RestaurantsController < ApplicationController
        before_action :find_resources, only: :index
        before_action :find_resource, only: :show

        def index
            render json: @restaurants, each_serializer: V1::RestaurantSerializer 
        end

        def show
            render json: @restaurant, serializer: V1::RestaurantSerializer
        end
    end
end