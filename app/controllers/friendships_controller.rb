class FriendshipsController < ApplicationController
  after_create :delete_request

  def create
    @friendship = Friendship.new(adder_id: params[:friend_id], added_id: current_user.id)
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

  private

  def delete_request
    request = FriendRequest.where(requester_id: friend_id, requested_id: current_user.id)[0]
    request&.destroy
  end
end
