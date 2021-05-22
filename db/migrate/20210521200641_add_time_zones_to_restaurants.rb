class AddTimeZonesToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :time_zone, :string, null: false, default: 'UTC'
  end
end
