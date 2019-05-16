class PostsController < ApplicationController
  before_action :init_comment, only[:index, :show]

  def index
    friends = current_user.friends.pluck(:friend_id)
    @posts = Post.all.where(user_id: friends).includes(:user, :comments, :likes)
  end

  def show
    @post = Post.includes(:user, :comments, :likes)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to @post
    else
      flash.now[:alert] = 'Post not created!'
      render 'new'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to root_url
  end

  private

  def post_params
    params.require(:posts).permit(:body)
  end

  def init_comment
    @comment = Comment.new
  end
end
