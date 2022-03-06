class AddColumnsToAdminUser < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :name, :string
    add_column :admin_users, :phone, :string
    add_column :admin_users, :phone2, :string
    add_column :admin_users, :vaccination, :boolean
  end
end
