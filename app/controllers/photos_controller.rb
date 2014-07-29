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
    @likes = @current_photo.likes
    @likers =@current_photo.likers
  end

  private

  def photo_params
    params.require(:photo).permit(:description, :picture_file)
  end
end
