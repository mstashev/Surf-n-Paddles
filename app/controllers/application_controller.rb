class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_recent_posts

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      flash[:warning] = "You need to be logged in to do this!"
      redirect_to :root unless current_user
    end
  end

  def load_recent_posts
    if params[:controller] == "posts" && params[:action] == "show"
      starter = Post.where("id != ?", params[:id])
    else
      starter = Post.all
    end
    @recent_posts ||= starter.order(created_at: :desc).limit(4)
  end

end
