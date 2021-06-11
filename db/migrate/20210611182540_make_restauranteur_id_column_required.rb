class MakeRestauranteurIdColumnRequired < ActiveRecord::Migration[6.1]
  def change
    change_column_null :restaurants, :restauranteur_id, false, User.first.id
  end
end
