class CommentsController < ApplicationController
  before_action :init_comment, only[:new]
  before_action :set_post, only[:create, :destroy]

  def new; end

  def create
    @comment = Post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash.now[:success] = 'comment successfully added'
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'Comment couldn\'t be created'
      render @post
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comments).permit(:content)
  end
end
