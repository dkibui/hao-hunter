class RenameIsAvailableToStatus < ActiveRecord::Migration[8.0]
  def change
    rename_column :listings, :is_available, :status
  end
end
