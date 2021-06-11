class RemoveMenuServiceStartHourColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :menus, :service_start_hour
    remove_column :menus, :service_end_hour
  end
end
