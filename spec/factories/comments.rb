# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.characters(number: 10) }
    rate { '5' }
  end
end
