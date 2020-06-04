class FollowRelationship < ApplicationRecord

    belongs_to :user, optional: :true
    

end
