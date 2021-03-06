# frozen_string_literal: true

class InfoCategory < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :information, optional: true
end
