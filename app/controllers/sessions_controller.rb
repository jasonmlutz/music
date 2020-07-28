class SessionsController < ApplicationController
  before_action :redirect_if_signed_in, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user.nil?
      flash[:errors] = ['Invalid email and/or password']
      redirect_to new_session_url
    elsif !@user.activated
      flash[:errors] = ['Please verify your account to continue.']
      redirect_to new_session_url
    else
      @user.reset_session_token!
      login!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
