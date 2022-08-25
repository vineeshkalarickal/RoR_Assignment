class Product < ApplicationRecord
  validates :name, :price, presence: true, length: {minimum:3, maximum:15}
end