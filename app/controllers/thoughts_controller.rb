class ThoughtsController < ApplicationController
  def create
    receiver = User.friendly.find(params[:user_id])
    @my_thoughts = current_user.thoughts
    @photo = Photo.new
    @thought = current_user.thoughts.new(thought_params.merge(receiver_id: receiver.id))

    if @thought.save
      redirect_to :back
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
