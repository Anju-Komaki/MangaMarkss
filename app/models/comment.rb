# frozen_string_literal: true

class Comment < ApplicationRecord
  # Relation
  belongs_to :user
  belongs_to :comic

  # validation
  validates :comment, presence: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
