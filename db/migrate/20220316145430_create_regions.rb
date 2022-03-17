class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.string :center, index: true

      t.timestamps
    end
  end
end
