class UserMailer < ApplicationMailer
  def welcome_email(user)
    mail(from: "nans.noel@gmail.com", to: user.email,
         subject: "Bienvenue chez Naboo cat store !")
  end

  def welcome_order(order)
    @order = order
    mail(from: "nans.noel@gmail.com", to: order.user.email,
         subject: "Merci pour votre commande !")
  end

  def welcome_admin(order)
    @order = order
    mail(from: "nans.noel@gmail.com", to: "nabooadmin@yopmail.com",
         subject: "Vous avez reçu une nouvelle commande !")
  end

end