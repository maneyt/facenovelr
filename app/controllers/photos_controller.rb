class PhotosController < ApplicationController
  def create
    photo = current_user.photos.create(photo_params)
    redirect_to root_path
  end

  def index
    user = User.find(params[:user_id])
    @photos = user.photos
  end

  def show
    @photo = Photo.find(params[:id])
  end

  private

  def photo_params
    params.require(:photo).permit(:description, :picture_file)
  end
end
