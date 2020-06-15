FactoryBot.define do
  factory :information do
    title { Faker::Lorem.characters(number:10) }
    body { Faker::Lorem.characters(number:10) }
  end
end