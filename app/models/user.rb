class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { maximum: 255 }
  validates :department, presence: true, length: { maximum: 100 }
  has_many :tweets
end
