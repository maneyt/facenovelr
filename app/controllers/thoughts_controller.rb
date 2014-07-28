class ThoughtsController < ApplicationController
  def create
    current_user.thoughts.create(thought_params)
    redirect_to root_path
  end
  
  private
    def thought_params
      params.require(:thought).permit(
        :body,
      )
    end
end
