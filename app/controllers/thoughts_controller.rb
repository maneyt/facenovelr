class ThoughtsController < ApplicationController
  def create
    receiver = User.find(params[:user_id])
    @my_thoughts = current_user.thoughts
<<<<<<< HEAD
    @thought = current_user.thoughts.new(thought_params)
    @photo = Photo.new
=======
    @thought = current_user.thoughts.new(thought_params.merge(receiver_id: receiver.id))
>>>>>>> 8209ad7... Users now have individual profile pages
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
