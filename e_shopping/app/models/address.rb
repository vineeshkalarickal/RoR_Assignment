class Address < ApplicationRecord
  validates :address, presence: true, length: { minimum: 3, maximum: 30 }
  validates :street, presence: true, length: { minimum: 3, maximum: 30 }
  validates :city, presence: true, length: { minimum: 3, maximum: 30 }
  validates :state, presence: true, length: { minimum: 3, maximum: 30 }
  validates :zip, presence: true

  belongs_to :user

end
