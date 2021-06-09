class CuisinePolicy < ApplicationPolicy
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
        create?
    end

    def edit?
        create?
    end

    def destroy?
        create?
    end

    def permitted_attributes_for_create
        [
            :name
        ]
    end

    def permitted_attributes_for_update
        permitted_attributes_for_create
    end
end