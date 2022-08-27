class Product < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :price, presence: true
  validates :quantity, presence: true
  validates :details, presence: true, length: { maximum: 1000, too_long: " %{count} characters is the maximum allowed" }
end
