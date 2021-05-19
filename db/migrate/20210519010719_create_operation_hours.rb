class CreateOperationHours < ActiveRecord::Migration[6.1]
  def change
    create_table :operation_hours do |t|
      t.references :schedulable, polymorphic: true, type: :uuid
      t.string :day
      t.time :opens
      t.time :closes
      t.datetime :valid_from
      t.datetime :valid_through

      t.timestamps
    end
  end
end
