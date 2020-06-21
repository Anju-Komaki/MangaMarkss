# frozen_string_literal: true

class ComicTag < ApplicationRecord
  belongs_to :comic, optional: true
  belongs_to :tag, optional: true
end
