class DashboardsController < ApplicationController
  def show
    @my_photos = current_user.photos
    @thought = Thought.new
    @my_thoughts = current_user.thoughts
    @photo = Photo.new
    @friend_requests = current_user.incoming_friend_requests
    @message = Message.new
    @messages = current_user.all_messages.order("created_at ASC")
  end
end
