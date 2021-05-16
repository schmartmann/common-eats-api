module V1
    class MenusController < ApplicationController

        def index
            restaurant = Restaurant.find(params[:restaurant_id]) 
            @menus = restaurant.menus
            render json: @menus, each_serializer: V1::MenuSerializer 
        end

        def show
            @menu = Menu.find(params[:id])
            render json: @menu, serializer: V1::MenuSerializer
        end
    end
end