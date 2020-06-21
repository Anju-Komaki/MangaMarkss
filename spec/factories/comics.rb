# frozen_string_literal: true

FactoryBot.define do
  factory :comic do
    isbn_code { Faker::Number.number(digits: 13) }
    title { Faker::Lorem.characters(number: 10) }
    author { Faker::Name.name }
    publisher { Faker::Lorem.characters(number: 5) }
    title_en { Faker::Lorem.characters(number: 10) }
    author_en { Faker::Name.name }
    publisher_en { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 20) }
  end
end
