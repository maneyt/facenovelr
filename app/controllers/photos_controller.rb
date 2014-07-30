class PhotosController < ApplicationController
  def create
    photo = current_user.photos.create(photo_params)
    redirect_to root_path
  end

  def index
    user = User.friendly.find(params[:user_id])
    @photos = user.photos
  end

  def show
    @current_photo = Photo.find(params[:id])
    @previous_photo = @current_photo.previous_photo_for_user
    @next_photo = @current_photo.next_photo_for_user
    @likes = @current_photo.likes
    @likers = @current_photo.likers
    @photo = Photo.find(params[:id])
    @comment = Comment.new
    @comments = @photo.sorted_comments
  end

  private

  def photo_params
    params.require(:photo).permit(:description, :picture_file)
  end
end
