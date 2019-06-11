module FriendshipsHelper
  def get_friendship(user)
    Friendship.find_by(sent_friend: current_user, received_friend: user) ||
    Friendship.find_by(sent_friend: user, received_friend: current_user)

  end
end
