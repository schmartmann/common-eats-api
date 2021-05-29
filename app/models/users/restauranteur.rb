class User
    module Restauranteur
        extend ActiveSupport::Concern

        included do
            has_many :restaurants
        end
    end
end