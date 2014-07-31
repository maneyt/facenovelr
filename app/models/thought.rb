class Thought < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  def self.newest_first
    order("created_at DESC")
  end
end
