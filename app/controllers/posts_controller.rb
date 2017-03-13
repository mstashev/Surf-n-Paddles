class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
    @users = User.joins(:chirps).order(folowers_count: :desc).limit(5)
    render 'posts/index.html.erb'
  end

  def home
    @post = Post.order('created_at desc').first
    render 'posts/home.html.erb'
  end

end
