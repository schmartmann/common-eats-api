class CourseItemRefinementPolicy < ApplicationPolicy
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
            :selection_type,
            :text,
            :course_item_id
        ]
    end

    def permitted_attributes_for_update
        permitted_attributes_for_create
    end
end