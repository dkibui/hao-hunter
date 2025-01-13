class CreateNotifications < ActiveRecord::Migration[8.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_keys: true
      t.references :listing, null: false, foreign_keys: true
      t.string :message, null: false
      t.timestamp :read_at

      t.timestamps
    end

    add_index :notifications, :read_at
  end
end
