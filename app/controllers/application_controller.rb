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

  helper_method :current_user, :logged_in?, :logout!, :current_user_is_admin?

  def current_user
    return nil if session[:session_token].nil?

    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def current_user_is_admin?
    current_user.admin
  end

  private
  def admin_or_note_owner
    note = Note.find_by(id: params[:id])
    if current_user.nil? || !current_user_is_admin? || (current_user.id != note.author_id)
      flash[:errors] = ["Access denied -- request requires admin status or note author."]
      redirect_to bands_url
    end
  end

  def admin_only
    if current_user.nil? || !current_user_is_admin?
      flash[:errors] = ["Access denied -- request requires admin status."]
      redirect_to bands_url
    end
  end

  def redirect_unless_signed_in
    redirect_to new_user_url if current_user.nil?
  end

  def redirect_if_signed_in
    redirect_to bands_url unless current_user.nil?
  end
end
