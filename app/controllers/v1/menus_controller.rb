module V1
    class MenusController < ApplicationController
        before_action :retrieve_restaurant, only: :index
        before_action :find_resource, only: %i[show update destroy]
        before_action :build_resource, only: :create

        def index
            render json: @restaurant.menus, each_serializer: V1::MenuSerializer 
        end

        def show
            render json: @menu, serializer: V1::MenuSerializer
        end

        def create
            if @menu.save
                render json: @menu, serializer: V1::MenuSerializer
            else
                render json: @menu.errors, status: :unprocessable_entity
            end
        end

        def update
            if @menu.update(permitted_attributes(@menu))
                render json: @menu, serializer: V1::MenuSerializer 
            else
                render json: @menu.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @menu.destroy!
            head :no_content
        end
      
        private 

        def retrieve_restaurant
            @restaurant = policy_scope(Restaurant).find(params[:restaurant_id])
        end
    end
end