# frozen_string_literal: true

class Clip < ApplicationRecord
  belongs_to :user
  belongs_to :comic
end
