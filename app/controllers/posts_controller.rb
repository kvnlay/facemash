class PostsController < ApplicationController

  def index
    @post = Post.new
    @comment = Comment.new
    @posts = current_user.all_friend_posts
  end

  def show
    @post = Post.with_comments_and_likes.find(params[:id])
    @comment = Comment.new
    @post = Post.new
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
