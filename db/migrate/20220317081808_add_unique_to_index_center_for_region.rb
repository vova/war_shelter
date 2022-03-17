class AddUniqueToIndexCenterForRegion < ActiveRecord::Migration[6.1]
  def change
    remove_index :regions, [:center]
    add_index :regions, [:center], unique: true
  end
end
