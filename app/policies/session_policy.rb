class SessionPolicy < ApplicationPolicy
    def create?
      true
    end
  
    def show?
      record.user == user
    end
  
    def destroy?
      record.user == user
    end
  
    def permitted_attributes
      %i[device_id]
    end
  
    class Scope < ApplicationPolicy::Scope
      def resolve
        scope.where(user: user)
      end
    end
  end
  