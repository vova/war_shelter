class AddColumnToAccommodationType < ActiveRecord::Migration[6.1]
  def change
    add_column :accommodation_types, :room, :integer
  end
end
