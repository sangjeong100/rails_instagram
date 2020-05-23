class CreateFollowRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_relationships do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
    add_index :follow_relationships, :follower_id
    add_index :follow_relationships, :following_id
    add_index :follow_relationships, [:follower_id, :following_id], unique: true
    #follower_id와followed_id의 조합은 반드시 유니크임을 의미하는 설정
    #이 설정에 의해 어떤 유저가 똑같은 유저를 2회이상 팔로우하는것을 막습니다.
  end
end
