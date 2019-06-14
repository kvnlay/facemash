class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.received_friendships.build(adder_id: params[:friend_id])
    if @friendship.save
      flash[:success] = 'You have added a new friend'
    else
      flash[:notice] = 'You cannot be friends'
    end
    redirect_back(fallback_location: friend_requests_path)
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy
    redirect_back(fallback_location: user_path)
  end
end
