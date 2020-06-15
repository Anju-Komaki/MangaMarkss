FactoryBot.define do
	factory :bookmark do
		association :comic
		user { comic.user }
	end
end