module V1
    class UserSerializer < ApplicationSerializer
        attributes :id, :email, :first_name, :last_name, :roles
    end
end
