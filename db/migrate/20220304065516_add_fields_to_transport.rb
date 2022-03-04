class AddFieldsToTransport < ActiveRecord::Migration[6.1]
  def change
    add_column :transports, :name, :integer
    add_column :transports, :company_transfer, :boolean, default: false

    add_index :transports, [:name, :company_transfer], unique: true
  end
end
