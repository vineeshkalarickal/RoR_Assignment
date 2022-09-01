class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :line_items, dependent: :destroy

  def username
    return self.name + ' [' + self.email + ']'
    # self.email.split('@')[0].capitalize
  end
         
end
