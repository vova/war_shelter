class DropPlaceStatusesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :place_statuses
  end
end
