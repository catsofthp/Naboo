class UserMailer < ApplicationMailer
  def welcome_email(user)
    mail(from: "nans.noel@gmail.com", to: user.email,
         subject: "This is a nice welcome email")
  end

  def welcome_order(order)
    mail(from: "nans.noel@gmail.com", to: order.user.email,
         subject: "Thank you for your order")
  end

end