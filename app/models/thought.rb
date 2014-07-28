class Thought < ActiveRecord::Base
  validates :body, presence: true
end
