class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus, id: :uuid do |t|
      t.string     :name,                  null: false
      t.string     :service_start_hour,    default: "09:00"
      t.string     :service_end_hour,      default: "23:59"
      t.references :restaurant,            null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
