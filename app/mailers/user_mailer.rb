class UserMailer < ApplicationMailer
  def welcome_email(user)
    mail(from: "nans.noel@gmail.com", to: "nans.noel@gmail.com",
         subject: "This is a nice welcome email")
  end

  def welcome_order(user)
    mail(from: "nans.noel@gmail.com", to: "nans.noel@gmail.com",
         subject: "This is a nice welcome email")
  end

end