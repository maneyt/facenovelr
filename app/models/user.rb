class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :thoughts, dependent: :destroy
=======
  has_many :photos
>>>>>>> Add photo table, users can upload photos via paperclip
end
