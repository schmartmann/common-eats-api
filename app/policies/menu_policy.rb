class MenuPolicy < ApplicationPolicy
    def index?
        true
    end

    def show?
        index?
    end

    def create?
        user.admin? || record.restaurant.restauranteur == user
    end

    def update?
        record.restaurant.restauranteur == user
    end

    def edit?
        update?
    end

    def destroy?
        update?
    end

    def permitted_attributes_for_create
        [
            :name,
            :service_start_hour,
            :service_end_hour,
            :restaurant_id
        ]
    end
end