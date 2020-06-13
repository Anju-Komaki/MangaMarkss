class Category < ApplicationRecord
	#Relation
	has_many :info_categories, dependent: :destroy
	has_many :informations, through: :info_categories

	#validation
	validates :name, presence: true
end
