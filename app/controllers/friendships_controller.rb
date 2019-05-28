class FriendshipsController < ApplicationController
  # before_action :set_friend, only: :destroy

  # wrong implementation

  # def index
  #   @user = User.find_by(params[:user_id])
  #   @friends = current_user.friends
  # end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy
    redirect_back(fallback_location: user_path)
  end

  # private

  # def set_friend
  #   @friend = current_user.friends.find(params[:id])
  # end
end
