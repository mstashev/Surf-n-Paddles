class UsersController < ApplicationController

    before_action :find_user, only: [:edit, :show, :update]

    def index
      @users = User.all
    end

    def show
      # find_user
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render :new
      end
    end

    def edit
      # find_user
    end

    def update
      # find_user
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :name, :password, :avatar_url, :email)
    end

    def find_user
      @user = User.find(params[:id])
    end

end