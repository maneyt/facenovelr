class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :body, presence: true
  validates :sender, presence: true
  validates :recipient, presence: true
end
