class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.received_friendships.build(adder_id: params[friend_id])
    if @friendship.save
      flash[:success] = 'You have added a new friend'
      redirect_back(fallback_location: user_path)
    else
      flash[:notice] = 'You cannot be friends'
      redirect_back(fallback_location: user_path)
    end
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy
    redirect_back(fallback_location: user_path)
  end
end
