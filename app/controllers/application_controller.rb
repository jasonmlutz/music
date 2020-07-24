class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?(user)
    current_user == user
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  helper_method :current_user, :logged_in?, :logout!

  def current_user
    return nil if session[:session_token].nil?

    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  private

  def redirect_unless_signed_in
    redirect_to new_user_url if current_user.nil?
  end

  def redirect_if_signed_in
    redirect_to bands_url unless current_user.nil?
  end
end
