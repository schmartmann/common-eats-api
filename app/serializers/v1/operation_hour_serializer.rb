module V1
    class OperationHourSerializer < ApplicationSerializer        
        attributes :id, :schedulable_type, :schedulable_id, :day, :opens, :closes, :valid_from, :valid_through, :parent_name

        def parent_name
            object.schedulable.name if object.schedulable.respond_to?(:name)
        end
    end
end