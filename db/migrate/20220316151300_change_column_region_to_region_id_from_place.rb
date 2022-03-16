class ChangeColumnRegionToRegionIdFromPlace < ActiveRecord::Migration[6.1]
  def up
    remove_column :places, :region
    add_column :places, :region_id, :integer
    add_index :places, :region_id
  end

  def down
    add_column :places, :region, :string
    remove_column :places, :region_id
  end
end
