FactoryBot.define do
	factory :user do
    username { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.email }
    caption { Faker::Lorem.characters(number:20) }
    password { 'password' }
    password_confirmation { 'password' }
	end
end