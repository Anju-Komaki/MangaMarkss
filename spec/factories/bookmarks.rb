# frozen_string_literal: true

FactoryBot.define do
  factory :bookmark do
    association :comic
    user { comic.user }
  end
end
