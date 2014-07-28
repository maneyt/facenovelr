class ThoughtsController < ApplicationController
  def create
    @my_thoughts = current_user.thoughts
    @thought = current_user.thoughts.new(thought_params)
    @photo = Photo.new
    if @thought.save
      redirect_to root_path
    else
      render "app/views/dashboards/show"
    end
  end
  
  private
    def thought_params
      params.require(:thought).permit(
        :body,
      )
    end
end
