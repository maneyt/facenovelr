class FriendshipsController < ApplicationController
  def create
    friendee = User.friendly.find(params[:user_id])
    Friendship.create(friender_id: current_user.id, friendee_id: friendee.id)
    redirect_to friendee
  end
end
