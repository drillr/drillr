class RegistrationsController < Devise::RegistrationsController

# during the waiting period for email confirmation user will be routed to
# login page and a flash will show for user to check email :)
  def after_inactive_sign_up_path_for(resource)
    flash[:registration] = "Check your email to confirm registration"
    user_session_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end
