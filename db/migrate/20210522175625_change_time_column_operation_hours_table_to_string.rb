class ChangeTimeColumnOperationHoursTableToString < ActiveRecord::Migration[6.1]
  def change
    change_column :operation_hours, :opens, :string
    change_column :operation_hours, :closes, :string
    rename_column :operation_hours, :opens, :start_time
    rename_column :operation_hours, :closes, :end_time
  end
end
