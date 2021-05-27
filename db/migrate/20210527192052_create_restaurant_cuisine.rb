class CreateRestaurantCuisine < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_cuisines do |t|
      t.references :cuisine,  null: false, foreign_key: true, type: :uuid
      t.references :restaurant, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
