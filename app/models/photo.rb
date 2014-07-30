class Photo < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes
  has_many :likers, through: :likes, source: :user
  belongs_to :user
  has_attached_file :picture_file,
    styles: {
      thumb: "100x100#",
    }

  validates :description, presence: true
  validates_attachment_presence :picture_file
  validates_attachment_content_type :picture_file, content_type: /\Aimage\/.*\Z/

  def sorted_comments
    comments.order("created_at DESC")
  end
  
  def next_photo_for_user
    user.photos.where("created_at < ?", created_at).order("created_at ASC").last
  end

  def previous_photo_for_user
    user.photos.where("created_at > ?", created_at).order("created_at ASC").first
  end
end
