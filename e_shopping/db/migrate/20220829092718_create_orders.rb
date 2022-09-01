class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :address_id
      t.decimal :actual_price
      t.integer :quantity
      t.decimal :final_price
      t.string :order_status

      t.timestamps
    end
  end
end
