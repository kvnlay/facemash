class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user_id: current_user.id)
    if @like.save
      flash[:success] = 'You\'ve liked this post'
    else
      flash[:error] = 'You cannot like this post'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Like.where(post_id: params[:id]).find_by(user: current_user).destroy
    redirect_back(fallback_location: root_path)
  end
end
