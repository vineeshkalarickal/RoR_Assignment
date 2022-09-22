class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, foreign_key: :cart_id
end
