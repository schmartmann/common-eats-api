module V1
    class RestaurantSerializer < ApplicationSerializer
        attributes :id, :name, :phone, :email, :street_address, :city, :state, :postal_code, :menus

        has_many :operation_hours, as: :schedulable

        def menus
            object.menus.collect { |menu| {menu_id: menu.id, menu_name: menu.name }}
        end
    end
end