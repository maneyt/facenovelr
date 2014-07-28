class User < ActiveRecord::Base
<<<<<<< HEAD
<<<<<<< HEAD
  has_many :thoughts, dependent: :destroy
=======
  has_many :photos
>>>>>>> Add photo table, users can upload photos via paperclip
=======
  has_many :photos, dependent: :destroy
>>>>>>> Add description column to photos, gitignore public/system
end
