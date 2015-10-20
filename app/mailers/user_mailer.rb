class UserMailer < ApplicationMailer
  default from: "aokincaid@wackoveture.com"

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Thanks for Signing Up!"
  end
end
