class PhotosController < ApplicationController
  def create
    photo = current_user.photos.create(photo_params)
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:photo).permit(:picture_file)
  end
end
