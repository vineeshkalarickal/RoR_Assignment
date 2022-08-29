class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.integer :user_id
      t.integer :cart_id
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.decimal :item_price
      t.decimal :item_total

      t.timestamps
    end
  end
end
