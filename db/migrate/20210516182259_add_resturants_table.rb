class AddResturantsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants, id: :uuid do |t|
      t.string :name,           null: false
      t.string :phone,          null: false
      t.string :email,          null: false
      t.string :street_address, null: false
      t.string :city,           null: false
      t.string :state,          null: false
      t.string :postal_code,    null: false
      t.string :time_zone,      null: false, default: 'UTC'

      t.timestamps
    end

    add_index :restaurants, :email, unique: true
    add_index :restaurants, :phone, unique: true
    add_index :restaurants, :name,  unique: true
  end
end
