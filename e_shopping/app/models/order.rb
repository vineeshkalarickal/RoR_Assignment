class Order < ApplicationRecord
  has_many :line_items
  belongs_to :user
  belongs_to :address ,optional: true

  def final_price
    sum = 0
    self.line_items.each do |line_item|
      sum+= line_item.total_price
    end
    return sum
 end
 
end
