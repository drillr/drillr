class UsersController < ApplicationController
  # NOTE: since we're using devise, this user controler is only for
  # index and show. all the user registration, sign in/out, and account
  # editing is handled by Devise's default controller.
  def index
    @users = User.order(points: :desc).limit(25)
  end

  def show
    @user = User.find(params[:id])
  end

  def dashboard
    if current_user && !current_user.is_admin?
      @user = current_user
    elsif current_user.is_admin?
      @user = current_user
      render :dashboard_admin
    else
      redirect_to root_path
    end
  end
end
