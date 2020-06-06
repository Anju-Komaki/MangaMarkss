class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #picture
  attachment :profile_image

  #Relation
  has_many :comics, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  #follow or unfollow?
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  #follow
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  #unfollow
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end
end
