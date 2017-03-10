class PostsController < ApplicationController
  def index
    @posts = Post.all
    render 'posts/index.html.erb'
  end

  def home
    @post = Post.order('created_at desc').first
    render 'posts/home.html.erb'
  end

end
