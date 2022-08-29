class Cart < ApplicationRecord
  has_many :line_items
  has_many :products
end
