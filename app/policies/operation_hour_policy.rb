class OperationHourPolicy < ApplicationPolicy
    def index?
        true
    end

    def show?
        index?
    end
    
    def create?
        user.admin? || user.restauranteur?
    end

    def update?
        (record.schedulable_type == 'Restaurant' && record.schedulable.restauranteur == user) ||
        (record.schedulable_type == 'Menu' && record.schedulable.restaurant.restauranteur == user) 
    end

    def edit?
        update?
    end

    def destroy?
        update?
    end

    def permitted_attributes_for_create
        [
            :schedulable_type,
            :schedulable_id,
            :time_zone,
            :day,
            :start_time,
            :end_time,
            :valid_from,
            :valid_through
        ]
    end

    def permitted_attributes_for_update
        permitted_attributes_for_create
    end
end