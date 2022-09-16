class Order < ApplicationRecord
  has_many :line_items
  belongs_to :user
  belongs_to :address, optional: true

end
