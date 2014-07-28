class AcceptedFriendshipsController < ApplicationController
  def create
    friendship = Friendship.find(params[:friendship_id])
    friendship.update_attributes(accepted: true)
    create_reverse_friendship(friendship)
    redirect_to root_path
  end

  private

  def create_reverse_friendship(friendship)
    Friendship.create(friender_id: friendship.friendee_id, friendee_id: friendship.friender_id, accepted: true)
  end
end
