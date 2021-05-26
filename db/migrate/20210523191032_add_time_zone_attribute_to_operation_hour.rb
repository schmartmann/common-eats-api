class AddTimeZoneAttributeToOperationHour < ActiveRecord::Migration[6.1]
  def change
    add_column :operation_hours, :time_zone, :string, null: false, default: 'UTC'
  end
end
