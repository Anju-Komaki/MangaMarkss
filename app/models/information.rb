class Information < ApplicationRecord
	#validation
	validates :title, presence: true
	validates :body, presence: true
end
