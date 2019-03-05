class UserMailer < ApplicationMailer
  def welcome_email(user)
    mail(from: "nans.noel@gmail.com", to: user.email,
         subject: "This is a nice welcome email")
  end
end