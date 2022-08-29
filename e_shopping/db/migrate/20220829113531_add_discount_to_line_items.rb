class AddDiscountToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :discount, :integer, default: 0
  end
end
