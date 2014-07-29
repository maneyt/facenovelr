class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :picture_file,
    :styles => {
      :thumb => "100x100#",
  }

  validates :description, presence: true
  validates_attachment_presence :picture_file
  validates_attachment_content_type :picture_file, content_type: /\Aimage\/.*\Z/
end
