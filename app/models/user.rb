class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, format: { with: /\A[a-zA-Z ]+\z/}
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  validates :birthday, presence: true
 
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
