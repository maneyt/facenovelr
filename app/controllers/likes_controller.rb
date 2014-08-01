class LikesController < ApplicationController
  def create
    current_user.likes.create(liked_object: find_liked_object)
    redirect_to :back
  end

  def destroy
    find_liked_object.likers.destroy(current_user)
    redirect_to :back
  end

  private

  def find_liked_object
    find_photo || find_thought || find_comment
  end

  def find_photo
    Photo.find_by(id: params[:photo_id])
  end

  def find_thought
    Thought.find_by(id: params[:thought_id])
  end

  def find_comment
    Comment.find_by(id:params[:comment_id])
  end
end
