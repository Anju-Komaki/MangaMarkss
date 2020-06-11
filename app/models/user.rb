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
  has_many :clips, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :active_notifications, class_name: "Notification", foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: 'visited_id', dependent: :destroy

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

  #notifications
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ?", current_user.id, id, "follow"])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: "follow"
        )
      notification.save if notification.valid?
    end
  end
end
