class AddCurrencyToPlace < ActiveRecord::Migration[6.1]
  def change
    rename_column :places, :is_price_in_dollars, :currency
    change_column :places, :currency, :string
  end
end
