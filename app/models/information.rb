class Information < ApplicationRecord
	#Relation
	has_many :info_categories, dependent: :destroy
	has_many :categories, through: :info_categories
	#validation
	validates :title, presence: true
	validates :body, presence: true
end
