module V1
    class RestaurantsController < ApplicationController
        before_action :find_resources, only: :index
        before_action :find_resource, only: %i[show update destroy]
        before_action :build_resource, only: :create

        def index
            render json: @restaurants, each_serializer: V1::RestaurantSerializer 
        end

        def show
            render json: @restaurant, serializer: V1::RestaurantSerializer
        end

        def create
            if @restaurant.save
                render json: @restaurant, serializer: V1::RestaurantSerializer
            else
                render json: @restaurant.errors, status: :unprocessable_entity
            end
        end

        def update
            if @restaurant.update(permitted_attributes(@restaurant))
                render json: @restaurant, serializer: V1::RestaurantSerializer 
            else
                render json: @restaurant.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @restaurant.destroy!
            head :no_content
        end
    end
end