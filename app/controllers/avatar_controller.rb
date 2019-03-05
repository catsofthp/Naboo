class AvatarController < ApplicationController
  def create
    @product = Product.find(params[:user_id])
    @product.avatar.attach(params[:avatar])
    redirect_to(user_path(@product))
  end

end
