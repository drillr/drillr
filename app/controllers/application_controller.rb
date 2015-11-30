class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    # byebug
    flash[:can_notice] = "Access Denied Maggot!"
    redirect_to new_user_session_path
  end

end
