class RestaurantPolicy < ApplicationPolicy
    def index?
        true
    end

    def show?
        index?
    end
    
    def create?
        user.admin?
    end

    def update?
        record.restauranteur == user
    end

    def edit?
        update?
    end

    def destroy?
        create?
    end

    def permitted_attributes_for_create
        [
            :name,
            :phone,
            :street_address,
            :city,
            :state,
            :postal_code,
            :time_zone
        ]
    end
end