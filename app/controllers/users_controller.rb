class UsersController < ApplicationController
  before_action :redirect_if_signed_in, only: [:new, :create]
  before_action :redirect_unless_signed_in, only: [:index]
  before_action :admin_only, only: [:promote]

  def index
    @users = User.all
    render :index
  end

  def promote
    user = User.find_by(id: params[:id])
    user.admin = true
    user.save!
    @users = User.all
    render :index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @activation_token = SecureRandom.urlsafe_base64
      @user.activation_token_digest = BCrypt::Password.create(@activation_token)
      @user.save!
      msg = NewUserMailer.verification_email(@user, @activation_token)
      msg.deliver_now
      flash[:errors] = ["We've send you an email! Please check and verify your account!"]
      redirect_to new_session_url
      # login!(@user)
      # flash[:errors] = ["activation token: #{@activation_token}"]
      # redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def new
    render :new
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render :show
    else
      redirect_to new_user_url
    end
  end

  def activate
    user = User.find_by_activation_token(activation_params[:email], activation_params[:activation_token])
    if user
      user.activate!
      flash[:errors] = ["Your account has been activated! Please sign in."]
      redirect_to new_session_url
    else
      flash[:errors] = ["Invalid activation credentials; please try again!"]
      redirect_to new_user_url
    end
  end

  private
  def activation_params
    params.require(:user).permit(:email, :activation_token)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
