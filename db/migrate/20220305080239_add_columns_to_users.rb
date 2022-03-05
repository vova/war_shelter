class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :status_id, :integer
    add_column :users, :coordinator_id, :integer
    add_column :users, :from, :string
    add_column :users, :destination, :string
    add_column :users, :adults, :integer
    add_column :users, :kids, :integer
    add_column :users, :kids_comment, :string
    add_column :users, :pets, :boolean
    add_column :users, :phone, :string
    add_column :users, :phone2, :string
    add_column :users, :geo, :string
    add_column :users, :accommodation_pref, :integer
    add_column :users, :transport_id, :integer
    add_column :users, :date_arrival, :datetime
    add_column :users, :request_id, :string
    add_column :users, :vaccination, :boolean
    add_column :users, :comment, :text
  end
end
