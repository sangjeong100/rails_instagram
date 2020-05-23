class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :nullify
  has_many :likes, dependent: :destroy

  has_many :followers, foreign_key: "follower_id", class_name: "follow_relationships", dependent: :destroy
  has_many :followings, foreign_key: "following_id", class_name: "follow_relationships" ,dependent: :destroy
  
  mount_uploader :profile_photo, AvatarUploader

end
