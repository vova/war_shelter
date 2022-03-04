class FixNameInTransport < ActiveRecord::Migration[6.1]
  def change
    change_column :transports, :name, :string
    add_timestamps :transports
  end
end
