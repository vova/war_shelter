class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :name, limit: 100, null: false
      t.integer :type
      t.string :city
      t.string :region
      t.integer :rooms_available
      t.integer :beds
      t.integer :kids_beds
      t.boolean :is_pets_allowed
      t.integer :capacity, default: 2, null: false
      t.integer :additional_child_place, default: 0
      t.integer :coordinator_id
      t.integer :status
      t.integer :price_per_day
      t.integer :price_per_month
      t.boolean :is_price_in_dollars
      t.string :address
      t.integer :distance_from_center
      t.datetime :available_since
      t.datetime :available_till
      t.string :phone
      t.string :phone2
      t.boolean :is_realtor
      t.string :contact_name
      t.string :geo
      t.string :website

      t.timestamps
    end
  end
end
