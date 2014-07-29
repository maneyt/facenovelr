class DashboardsController < ApplicationController
  def show
    @photos = current_user.photos
    @thought = Thought.new
    @my_thoughts = current_user.thoughts
    @photo = Photo.new
    @friend_requests = current_user.incoming_friend_requests
  end
end
