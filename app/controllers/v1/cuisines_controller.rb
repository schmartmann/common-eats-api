module V1
    class CuisinesController < ApplicationController

        def index
            @cuisines = Cuisine.all
            render json: @cuisines, each_serializer: V1::CuisineSerializer 
        end

        def show
            @cuisine = Cuisine.find(params[:id])
            render json: @cuisine, serializer: V1::CuisineWithRestaurantsSerializer
        end
    end
end