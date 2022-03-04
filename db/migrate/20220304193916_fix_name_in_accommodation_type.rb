class FixNameInAccommodationType < ActiveRecord::Migration[6.1]
  def change
    change_column :accommodation_types, :name, :string
    add_timestamps :accommodation_types
  end
end
