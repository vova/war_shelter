class RenameColumnInPlace < ActiveRecord::Migration[6.1]
  def change
    rename_column :places, :accomodation_type_id, :accommodation_type_id
  end
end
