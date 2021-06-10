module V1
    class OperationHoursController < ApplicationController
        before_action :schedulable_type, only: :index
        before_action :current_time, only: :index
        before_action :schedulable_serializer, only: :index
        before_action :find_resource, only: %i[show update destroy]
        before_action :build_resource, only: :create

        def index
            @open_schedulable = policy_scope(OperationHour).send("open_#{@schedulable_type.pluralize}", Time.parse(@current_time))
            render json: @open_schedulable, each_serializer: schedulable_serializer
        end

        def show
            render json: @operation_hour, serializer: V1::OperationHourSerializer
        end

        def create
            if @operation_hour.save
                render json: @operation_hour, serializer: V1::OperationHourSerializer
            else
                render json: @operation_hour.errors, status: :unprocessable_entity
            end
        end

        def update
            if @operation_hour.update(permitted_attributes(@operation_hour))
                render json: @operation_hour, serializer: V1::OperationHourSerializer 
            else
                render json: @operation_hour.errors, status: :unprocessable_entity
            end
        end

        def destroy
            @operation_hour.destroy!
            head :no_content
        end

        private 

        def schedulable_type
            @schedulable_type ||= params[:schedulable_type]
        end

        def schedulable_serializer
            @schedulable_serializer ||=  "V1::#{@schedulable_type.capitalize}Serializer".constantize
        end

        def current_time
            @current_time ||= Time.current.in_time_zone(params[:tz]).to_s
        end
    end
end