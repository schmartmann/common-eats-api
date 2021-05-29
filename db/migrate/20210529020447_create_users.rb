class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.boolean :admin
      t.boolean :customer
      t.boolean :restauranteur
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :password_digest

      t.timestamps
    end
  end
end
