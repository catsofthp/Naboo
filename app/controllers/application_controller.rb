class ApplicationController < ActionController::Base
  before_action :create_cart

  def create_cart
    if user_signed_in? && current_user.cart == nil then Cart.create!(user: current_user) end
  end
  
end
