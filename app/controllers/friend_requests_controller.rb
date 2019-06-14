class FriendRequestsController < ApplicationController

  def index
    @incoming = current_user.received_requests
  end

  def create
    requested = User.find(params[:requested_id])
    @friend_request = current_user.sent_requests.build(requested: requested)
    if @friend_request.save
      flash[:success] = 'Friend request has been sent'
    else
      flash[:danger] = 'Error sending friend request'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    flash[:alert] = @friend_request.destroy ? "Request declined" : "Request couldn't be declined"
    redirect_back(fallback_location: friend_requests_path)
  end
end
