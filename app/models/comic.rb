class Comic < ApplicationRecord
	#picture
	attachment :comic_image

	#tag
	acts_as_taggable

	#Relation
	belongs_to :user, optional: true
	has_many :comments, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	def bookmarked_by?(user)
		bookmarks.where(user_id: user.id).exists?
	end
end
