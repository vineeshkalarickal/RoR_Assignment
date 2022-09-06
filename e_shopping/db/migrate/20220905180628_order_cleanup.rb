class OrderCleanup < ActiveRecord::Migration[7.0]
  def change
    drop_table :orders
    create_table :orders do |t|
      t.integer :user_id
      t.integer :address_id
      t.integer :cart_id      
      t.integer :line_items_id
      t.decimal :final_price
      t.string :order_status

      t.timestamps
    end
  end
end
