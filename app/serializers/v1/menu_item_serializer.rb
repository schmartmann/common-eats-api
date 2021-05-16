module V1
    class MenuItemSerializer < ApplicationSerializer
        attributes :id, :name, :description, :price

        has_many :menu_item_refinements
    end
end