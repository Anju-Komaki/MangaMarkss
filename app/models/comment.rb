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
end
