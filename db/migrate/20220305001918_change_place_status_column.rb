class ChangePlaceStatusColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :places, :status, :integer, default: 0
  end
end
