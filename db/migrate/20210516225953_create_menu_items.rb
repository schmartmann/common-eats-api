class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items, id: :uuid do |t|
      t.references :course,  null: false, foreign_key: true, type: :uuid
      t.string :name,        null: false
      t.string :description, null: false
      t.float :price,        null: false

      t.timestamps
    end
  end
end
