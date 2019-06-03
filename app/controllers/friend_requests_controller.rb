class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [:create]

  def create
    friend = User.find(params[:requested_id])
    @friend_request = FriendRequest.new(requester_id: current_user.id, requested_id: friend.id)
    if @friend_request.save
      flash[:success] = 'Friend request has been sent'
    else
      flash[:danger] = 'Error sending friend request'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @friend_request.destroy
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
