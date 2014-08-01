class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  has_many :likes, as: :liked_object, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :body, presence: true
  validates :commentable, presence: true
  validates :user, presence: true
end
