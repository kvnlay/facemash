class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def init_comment
    @comment = Comment.new
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
