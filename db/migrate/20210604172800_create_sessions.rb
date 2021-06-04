class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions, id: :uuid do |t|
      t.datetime :expires_at
      t.string :user_agent
      t.uuid :user_id
      t.string :device_id

      t.timestamps
    end
  end
end
