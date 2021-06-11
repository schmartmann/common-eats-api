module V1
    class CuisinesController < ApplicationController
        before_action :find_resources, only: :index
        before_action :find_resource, only: %i[show update destroy]
        before_action :build_resource, only: :create

        def index
            render json: @cuisines, each_serializer: V1::CuisineSerializer 
        end

        def show
            render json: @cuisine, serializer: V1::CuisineWithRestaurantsSerializer
        end

        def create
            if @cuisine.save
                render json: @cuisine, serializer: V1::CuisineSerializer
            else
                render json: @cuisine.errors, status: :unprocessable_entity
            end
        end

        def update
            if @cuisine.update(permitted_attributes(@cuisine))
                render json: @cuisine, serializer: V1::CuisineSerializer
            else
                render json: @cuisine.errors, serializer: V1::CuisineSerializer
            end
        end

        def destroy
            @cuisine.destroy!
            head :no_content
        end
    end
end