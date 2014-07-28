class DashboardsController < ApplicationController
  def show
<<<<<<< HEAD
    @thought = Thought.new
    @my_thoughts = current_user.thoughts
=======
    @photo = Photo.new
>>>>>>> Add photo table, users can upload photos via paperclip
  end
end
