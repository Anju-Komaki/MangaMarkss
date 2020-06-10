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

	#validation
	validates :isbn_code, presence: true
	validates :title, presence: true
	validates :author, presence: true
	validates :publisher, presence: true
	validates :title_en, presence: true
	validates :author_en, presence: true
	validates :publisher_en, presence: true
	validates :body, presence: true
	validates :tag_list, presence: true
end
