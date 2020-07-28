class NewUserMailer < ApplicationMailer
  default from: 'admin@aa-music-app.com'

  def verification_email(user)
    @user = user
    
  end
end
