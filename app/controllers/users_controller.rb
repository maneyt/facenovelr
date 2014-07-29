class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @friendship = Friendship.new
    @thought = Thought.new
    @user = User.friendly.find(params[:slug])
    @user_photos = @user.photos
    @received_thoughts = Thought.where(receiver_id: @user.id)
    @sent_thoughts = @user.thoughts
    @friendship = Friendship.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, 
      :password,
      :name,
      :birthday,
    )
  end
end
