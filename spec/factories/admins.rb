FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    username { Faker::Lorem.characters(number:10) }
    password { 'password' }
    password_confirmation { 'password' }
  end
end