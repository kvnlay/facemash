class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [:index, :create]

  def index
    @incoming = current_user.requesters
    @outgoing = current_user.requesteds
  end

  def create
    friend = User.find(params[:requested_id])
    @friend_request = current_user.sent_requests.new(requested: friend)
    if @friend_request.save
      flash[:success] = 'Friend request has been sent'
    else
      flash[:danger] = 'Error sending friend request'
    end
    redirect_back(fallback_location: root_path)
  end

  def update
    @friend_request.accept
  end

  def destroy
    @friend_request.destroy
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
