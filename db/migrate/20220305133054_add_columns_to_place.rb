class AddColumnsToPlace < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :comment, :text
    add_column :places, :floor, :string
    add_column :places, :is_newbuilding, :boolean
  end
end
