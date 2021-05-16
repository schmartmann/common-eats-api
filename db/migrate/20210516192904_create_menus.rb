class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus, id: :uuid do |t|
      t.string :name,           null: false
      t.references :restaurant, null: false

      t.timestamps
    end
  end
end
