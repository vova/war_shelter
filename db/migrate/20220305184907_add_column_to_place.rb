class AddColumnToPlace < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :assigned_to, :integer
    add_index :places, :assigned_to
  end
end
