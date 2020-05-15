class Comment < ApplicationRecord

  paginates_per 5 #page 당 5개의 comment 정의 

  belongs_to :post ,optional:true
  belongs_to :user ,optional:true
    
end
