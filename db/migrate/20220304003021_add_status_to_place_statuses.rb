class AddStatusToPlaceStatuses < ActiveRecord::Migration[6.1]
  def change
    add_column :place_statuses, :name, :integer
    add_index :place_statuses, :name, unique: true
  end
end
