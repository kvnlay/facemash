class LikesController < ApplicationController
  before_action :set_post

  def create
    if already_liked?
      @like.destroy
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
