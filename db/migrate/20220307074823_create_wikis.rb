class CreateWikis < ActiveRecord::Migration[6.1]
  def change
    create_table :wikis do |t|
      t.integer :page_id, index: true
      t.string :title, limit: 100, null: false
      t.text :body

      t.timestamps
    end
  end
end
