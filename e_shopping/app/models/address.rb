class Address < ApplicationRecord
  validates :address, presence: true, length: { minimum: 3, maximum: 15 }
  validates :address, presence: true, length: { minimum: 3, maximum: 15 }
  validates :city, presence: true, length: { minimum: 3, maximum: 15 }
  validates :zip, presence: true

  belongs_to :user

end
