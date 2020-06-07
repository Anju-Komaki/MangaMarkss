class Information < ApplicationRecord
	#tag
	acts_as_taggable

	#validation
	validates :title, presence: true
	validates :body, presence: true
end
