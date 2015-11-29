class UsersController < ApplicationController
  # NOTE: since we're using devise, this user controler is only for
  # index and show. all the user registration, sign in/out, and account
  # editing is handled by Devise's default controller.
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def dashboard
    if current_user
      @user = current_user
    else
      redirect_to root_path
    end
  end
end
