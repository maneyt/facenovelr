class User < ActiveRecord::Base
  has_many :thoughts, dependent: :destroy
  has_many :photos
  has_many :photos, dependent: :destroy
end
