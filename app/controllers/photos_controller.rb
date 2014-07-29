class PhotosController < ApplicationController
  def create
    photo = current_user.photos.create(photo_params)
    redirect_to root_path
  end

  def index
    user = User.friendly.find(params[:user_id])
    @photos = user.photos
  end

  private

  def photo_params
    params.require(:photo).permit(:description, :picture_file)
  end
end
