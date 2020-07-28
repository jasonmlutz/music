class UsersController < ApplicationController
  before_action :redirect_if_signed_in, only: [:new, :create]

  def create
    @user = User.new(user_params)
    if @user.save
      @activation_token = SecureRandom.urlsafe_base64
      @user.activation_token_digest = BCrypt::Password.create(@activation_token)
      @user.save!
      login!(@user)
      flash[:errors] = ["activation token: #{@activation_token}"]
      redirect_to user_url(@user)
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

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
