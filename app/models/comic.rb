class Comic < ApplicationRecord
	#picture
	attachment :comic_image

	#tag
	acts_as_taggable

	#Relation
	belongs_to :user, optional: true
	has_many :comments, dependent: :destroy
end
