class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :nullify
  has_many :likes, dependent: :destroy

  has_many :followers, foreign_key: "follower_id", class_name: "FollowRelationship", dependent: :destroy #자신의 id 담기고
  has_many :followings, foreign_key: "following_id", class_name: "FollowRelationship" ,dependent: :destroy #자기를 follow한 사람 id 담김



  #class 명은 대문자로 시작하며, _는 대문자로 구분

  mount_uploader :profile_photo, AvatarUploader

end
