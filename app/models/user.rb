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

end
