class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :image_url
      t.integer :quantity
      t.string :category_id
      t.string :store_id

      t.timestamps
    end
  end
end
