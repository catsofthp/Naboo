class AvatarsController < ApplicationController

  def create

    @product = Product.find_by(title: params[:product_id].capitalize)

    @product.avatar.attach(params[:avatar])
    redirect_to(product_path(@product))
  end

end
