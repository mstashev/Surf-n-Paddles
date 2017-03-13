class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_recent_posts

  private

  def load_recent_posts
    if params[:controller] == "posts" && params[:action] == "show"
      starter = Post.where("id != ?", params[:id])
    else
      starter = Post.all
    end
    @recent_posts ||= starter.order(created_at: :desc).limit(4)
  end

end
