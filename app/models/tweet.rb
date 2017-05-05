class Tweet < ActiveRecord::Base
	has_many :likes
	validates :tweet, presence: true, length: { maximum: 255 }
	belongs_to :user
end
