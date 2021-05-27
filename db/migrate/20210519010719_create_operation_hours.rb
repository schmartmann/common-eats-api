class CreateOperationHours < ActiveRecord::Migration[6.1]
  def change
    create_table :operation_hours, id: :uuid  do |t|
      t.references :schedulable, polymorphic: true, type: :uuid
      t.integer :day
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :valid_from
      t.datetime :valid_through
      t.string   :time_zone,      null: false, default: 'UTC'

      t.timestamps
    end
  end
end
