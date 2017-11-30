class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :signed_in?, :logout!
  
  def user_sign_in!(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
  def signed_in?
    !!current_user
  end
  
  def logout!
    if signed_in?
      current_user.reset_session_token!
      @current_user = nil
      session[:session_token] = nil
    end
  end
end
