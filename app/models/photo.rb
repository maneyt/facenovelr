class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :picture_file

  validates :picture_file, presence: true
  validates_attachment_content_type :picture_file, :content_type => /\Aimage\/.*\Z/
end
