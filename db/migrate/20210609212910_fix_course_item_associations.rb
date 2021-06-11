class FixCourseItemAssociations < ActiveRecord::Migration[6.1]
  def change
    rename_column :course_item_refinements, :menu_item_id, :course_item_id
  end
end
