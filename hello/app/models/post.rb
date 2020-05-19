class Post < ApplicationRecord

  #paginates_per 10 #page 당 10개의 post 정의 

  belongs_to :user, optional: :true  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :avatar, AvatarUploader


  is_impressionable #Make my models impressionable.  조회수 구현

end
