class NewUserMailer < ApplicationMailer
  default from: "Registration Robot<registration@aa-music-app.com>"

  def verification_email(user, activation_token)
    @user = user
    @activation_token = activation_token
    mail(to: user.email, subject: 'Please verify your account')
  end
end
