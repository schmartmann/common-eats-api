class User
    module Restauranteur
        extend ActiveSupport::Concern

        included do
            has_many :restaurants, foreign_key: :restauranteur_id, inverse_of: :restauranteur, dependent: :destroy
        end
    end
end