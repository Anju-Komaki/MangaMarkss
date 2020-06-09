class Comment < ApplicationRecord
	#Relation
	belongs_to :user
	belongs_to :comic
	has_many :likes, dependent: :destroy

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

	#validation
	validates :comment, presence: true
	validates :rate, numericality: {
		less_than_or_equal_to: 5,
		greater_than_or_equal_to: 1
	}, presence: true
end
