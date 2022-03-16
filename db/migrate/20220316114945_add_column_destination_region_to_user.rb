class AddColumnDestinationRegionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :destination_region, :string
  end
end
