class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.boolean :admin, null: false, default: false
      t.boolean :customer, null: false, default: false
      t.boolean :restauranteur, null: false, default: false
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
