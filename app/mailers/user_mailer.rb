class UserMailer < ApplicationMailer
  def welcome_email(user)
    mail(from: "nans.noel@gmail.com", to: user.email,
         subject: "This is a nice welcome email")
  end

  def welcome_order(order)
    @order = order
    mail(from: "nans.noel@gmail.com", to: "nabooadmin@yopmail.com",
         subject: "Thank you for your order")
  end

  def welcome_admin(order)
    mail(from: "nans.noel@gmail.com", to: "nabooadmin@yopmail.com",
         subject: "You have received an order")
  end

end