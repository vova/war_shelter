class AddColumCountryId < ActiveRecord::Migration[6.1]
  def change
    tables = [:places, :users, :admin_users]

    tables.each do |table_name|
      add_column table_name, :country_id, :integer
      add_index table_name, :country_id
    end
  end
end
