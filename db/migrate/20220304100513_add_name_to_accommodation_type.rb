class AddNameToAccommodationType < ActiveRecord::Migration[6.1]
  def change
    add_column :accommodation_types, :name, :integer
    add_index :accommodation_types, :name, unique: true
  end
end
