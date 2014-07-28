class AddAttachmentPictureFileToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :picture_file
    end
  end

  def self.down
    remove_attachment :photos, :picture_file
  end
end
