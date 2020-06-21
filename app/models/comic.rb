# frozen_string_literal: true

class Comic < ApplicationRecord
  # picture
  attachment :comic_image

  # Relation
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :comic_tags, dependent: :destroy
  has_many :tags, through: :comic_tags

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  def cliped_by?(user)
    clips.where(user_id: user.id).exists?
  end

  # validation
  validates :isbn_code, presence: true, format: { with: /\A[0-9]+\z/ } # 半角数字のみ
  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :title_en, presence: true
  validates :author_en, presence: true
  validates :publisher_en, presence: true
  validates :body, presence: true
end
