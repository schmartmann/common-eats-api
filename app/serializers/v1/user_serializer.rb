module V1
    class UserSerializer < ApplicationSerializer
        attributes :id, :email, :first_name, :last_name, :roles

        def roles
            {
                admin: object.admin,
                customer: object.customer,
                restauranteur: object.restauranteur
            }
        end
    end
end
