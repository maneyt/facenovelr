class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :profile_picture, 
    default_url: "default_:style.png",
    styles: {
      medium: "300x300#",
      thumbnail: "75x75#",
    }
  validates_attachment :profile_picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :name, presence: true, format: { with: /\A[a-zA-Z ]+\z/}
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  validates :birthday, presence: true
 
  has_many :comments, dependent: :destroy
  has_many :thoughts, dependent: :destroy
  has_many :received_thoughts, foreign_key: :receiver_id, class_name: "Thought"
  has_many :photos, dependent: :destroy
  has_many :friendships, foreign_key: :friendee_id
  has_many :accepted_friendships, -> { where(accepted: true) }, foreign_key: :friendee_id, class_name: "Friendship"
  has_many :likes, dependent: :destroy
  has_many :friends, through: :accepted_friendships, source: :friender

  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :received_messages, class_name: "Message", foreign_key: :recipient_id

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

  def unfriend(user)
    transaction do
      self.friends.destroy(user)
      user.friends.destroy(self)
    end
  end
  def like_photo(photo)
    liked_photos << photo
  end

  def unlike_photo(photo)
    liked_photos.destroy(photo)
  end

  def all_messages
    Message.where("sender_id = :id or recipient_id = :id", { id: id }).order("created_at ASC")
  end

  def messages_with(user)
    Message.where("(sender_id = :user and recipient_id = :other_user) 
                  or (sender_id = :other_user and recipient_id = :user)",
                  {user: id, other_user: user.id}).order("created_at ASC")
  end

  def timeline
    Thought.where(user_id: friend_ids + [id])
  end
end
