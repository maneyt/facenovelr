class LikesController < ApplicationController
  def create
    photo = Photo.find(params[:photo_id])
    current_user.like_photo(photo)
    redirect_to photo
  end

  def destroy
    photo = Photo.find(params[:photo_id])
    current_user.unlike_photo(photo)
    redirect_to photo
  end
end
