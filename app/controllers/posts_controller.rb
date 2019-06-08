class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = current_user.all_friend_posts
  end

  def show
    @post = Post.with_comments_and_likes.find(params[:id])
  end

  def new
    @post = Post.new
    # @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
    else
      flash.now[:alert] = 'Post not created!'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
