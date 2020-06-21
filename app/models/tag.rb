# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :comic_tags, dependent: :destroy
  has_many :comics, through: :comic_tags

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
