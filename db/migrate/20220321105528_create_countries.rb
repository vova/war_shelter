class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.integer :code, default: 0, index: true
      t.string :name
      t.string :default_city
      t.string :time_zone

      t.timestamps
    end
  end
end
