class ApplicationController < ActionController::Base

  helper_method :user_sign_in?, :current_user

  private
  def user_sign_in?
    session[:session] != nil
  end

  def current_user
    User.find(session[:session])
  end

  def authenticate_user
    if not user_sign_in?
      redirect_to sign_in_users_path
    end
  end
end
