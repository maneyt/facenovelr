class Search 
 include ActiveModel::Model

 attr_accessor :user_name

 def results
   User.where("name Ilike  ?", "%#{user_name}%")
 end

end
