class FollowRelationship < ApplicationRecord
    belongs_to :user, optimal: :true
end
