class RenameMenuItemColumn < ActiveRecord::Migration[6.1]
  def change
    rename_table('menu_items', 'course_items')
    rename_table('menu_item_refinements', 'course_item_refinements')
  end
end
