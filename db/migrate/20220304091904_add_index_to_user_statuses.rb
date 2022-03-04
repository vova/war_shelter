class AddIndexToUserStatuses < ActiveRecord::Migration[6.1]
  def change
    add_index :user_statuses, :status, unique: true
  end
end
