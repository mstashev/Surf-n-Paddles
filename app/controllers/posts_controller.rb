class PostsController < ApplicationController

  before_action :find_post, only: [:edit, :show, :update, :share]
  before_action :require_user, only: [:edit, :show, :update]
  before_action :is_owner, only: [:destroy]

  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
    @users = User.joins(:posts).order(created_at: :desc).limit(5)
    render 'posts/index.html.erb'
  end

  def home
    @post = Post.order('created_at desc').first
    render 'posts/home.html.erb'
  end

  def new
    @post = Post.new
  end

  def show
    # find_post
  end

  def edit
    # find_post
  end

  def update
    # find_post
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    # find_post
    @post.destroy
    redirect_to :root
  end

  def share

  end

  def share_email
    UserMailer.share(params[:id], params[:share][:email]).deliver
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :email)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def is_owner
    find_post
    unless @post.user == current_user
      flash[:danger] = "You are not the creator of this Post."
      redirect_to :root
    end
  end

end
