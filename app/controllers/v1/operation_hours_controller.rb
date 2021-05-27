module V1
    class OperationHoursController < ApplicationController

        def retrieve_open_restaurants_by_time_zone
            current_time = Time.current.in_time_zone(params[:tz])
            @operation_hours = OperationHour.restaurants.today(current_time).started_since(current_time).ends_after(current_time)
        end
        
        def retrieve_restaurant_operation_hours
            restaurant = Restaurant.find(params[:restaurant_id])
            @operation_hours = restaurant.operation_hours

            render json: @operation_hours, each_serializer: V1::OperationHourSerializer
        end

        def retrieve_menu_operation_hours
            menu = Menu.find(params[:menu_id])
            @operation_hours = menu.operation_hours
            
            render json: @operation_hours, each_serializer: V1::OperationHourSerializer
        end
    end
end