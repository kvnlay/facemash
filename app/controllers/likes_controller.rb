class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.build(user_id: current_user.id)
    if @like.save
      flash[:success] = 'You\'ve liked this post'
      redirect_to post_path(@post)
    else
      flash.now[:error] = 'You cannot like this post'
      render :post
    end
  end

  def destroy
    like = Like.find_by(id: params[:id])
    like&.destroy
    redirect_back(fallback_location: root_path)
  end
end
