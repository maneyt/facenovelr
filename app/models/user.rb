class User < ActiveRecord::Base
  has_many :thoughts, depend: :destroy
end
