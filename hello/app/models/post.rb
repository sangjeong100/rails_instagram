class Post < ApplicationRecord

  #paginates_per 10 #page 당 10개의 post 정의 

  belongs_to :user, optional: :true  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  is_impressionable #Make my models impressionable. 

end
