class DashboardsController < ApplicationController
  def show
    @thought = Thought.new
    @my_thoughts = current_user.thoughts
    @photo = Photo.new
    @friend_requests = current_user.incoming_friend_requests
  end
end