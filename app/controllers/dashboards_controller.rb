class DashboardsController < ApplicationController
  def show
    @thought = Thought.new
    @my_thoughts = current_user.thoughts
    @photo = Photo.new
  end
end
