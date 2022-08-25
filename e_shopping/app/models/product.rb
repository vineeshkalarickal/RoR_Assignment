class Product < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  validates :name, :price, presence: true, length: {minimum:3, maximum:15}
end