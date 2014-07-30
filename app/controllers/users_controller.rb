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
    @received_thoughts = Thought.where(receiver_id: @user.id).order("created_at DESC")
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

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update(user_params)
      redirect_to user_show_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email, 
      :password,
      :name,
      :birthday,
      :location,
      :about_me,
      :profile_picture,
    )
  end
end
