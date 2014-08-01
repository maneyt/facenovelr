class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :liked_object, polymorphic: true

  validates :liked_object, presence: true
  validates :user, presence: true
end
