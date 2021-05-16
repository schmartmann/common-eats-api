module V1
    class RestaurantSerializer < ApplicationSerializer
        attributes :id, :name, :phone, :email, :street_address, :city, :state, :postal_code

        has_many :menus
    end
end