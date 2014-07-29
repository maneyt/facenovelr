class User < ActiveRecord::Base
  has_many :thoughts, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :friendships, foreign_key: :friendee_id
  has_many :likes
  has_many :liked_photos, through: :likes, source: :photo

  has_many :accepted_friendships, -> { where(accepted: true) }, foreign_key: :friendee_id, class_name: "Friendship"
  has_many :friends, through: :accepted_friendships, source: :friender

  def incoming_friend_requests
    friendships.where(accepted: false)
  end

  def friends_with?(user)
    friends.include?(user)
  end

  def received_friend_request_from?(user)
    Friendship.exists?(friender_id: user.id, friendee_id: id)
  end

  def friend_request_from(user)
    incoming_friend_requests.find_by(friender_id: user.id)
  end

  def sent_friend_request_to?(user)
    Friendship.exists?(friender_id: id, friendee_id: user.id)
  end

  def can_friend(user)
    self != user && !friends_with?(user) && !sent_friend_request_to?(user)
  end

  def like_photo(photo)
    liked_photos << photo
  end

  def unlike_photo(photo)
    liked_photos.destroy(photo)
  end
end
