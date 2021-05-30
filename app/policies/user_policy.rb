class UserPolicy < ApplicationPolicy
    allow_anonymous_users!
  
    def create?
      user.nil? || user.admin?
    end
  
    def show?
      user&.admin? || record == user
    end
  
    def update?
      user&.admin? || record == user
    end
  
    def destroy?
      user&.admin? || record == user
    end
  
    def permitted_attributes
      [:email, :first_name, :last_name, :password, :phone, { roles: [] }]
    end
  end
  