class User < ActiveRecord::Base
  has_many :thoughts, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :friendships

  def incoming_friend_requests
    Friendship.where(friendee_id: id, accepted: false)
  end

  def friends
    friendships = Friendship.where(friendee_id: id, accepted: true)
    friendships.map(&:friender)
  end
end
