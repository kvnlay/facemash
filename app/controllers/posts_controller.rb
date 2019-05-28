class PostsController < ApplicationController

  def index
    # friends = current_user.friends.pluck(:friend_id)
    # friends << current_user.id
    @comment = Comment.new
    @posts = Post.all.user_friends(current_user).with_comments_and_likes
  end

  def show
    @post = Post.with_comments_and_likes
    @comment = Comment.new
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
end
