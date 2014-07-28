class ThoughtsController < ApplicationController
  def create
    thought = current_user.thoughts.new(thought_params)
    thought.save
    redirect_to root_path
  end
  
  private
    def thought_params
      params.require(:thought).permit(
        :body,
      )
    end
end
