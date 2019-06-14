module FriendRequestsHelper
  def get_request(user)
    FriendRequest.find_by(requester: current_user, requested: user) ||
      FriendRequest.find_by(requester: user, requested: current_user)
  end
end
