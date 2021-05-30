class AddRestauranteurIdToRestaurantsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :restauranteur_id, :string, foreign_key: true
  end
end
