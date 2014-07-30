class CommentsController < ApplicationController
  def create
    commentable = find_commentable
    comment = current_user.comments.create(comment_params.merge(commentable: commentable))
    render comment
  end

  private

  def find_commentable
    find_photo || find_thought
  end

  def find_photo
    Photo.find_by(id: params[:photo_id])
  end

  def find_thought
    Thought.find_by(id: params[:thought_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
