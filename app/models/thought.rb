class Thought < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :likes, as: :liked_object, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  def self.newest_first
    order("created_at DESC")
  end
end
