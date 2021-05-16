class CreateMenuItemRefinements < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_item_refinements, id: :uuid do |t|
      t.references :menu_item,      null: false, foreign_key: true, type: :uuid
      t.string     :text,           null: false
      t.string     :selection_type, null: false, default: 'radio'

      t.timestamps
    end
  end
end
