class AvatarsController < ApplicationController

  def create

    @product = Product.friendly.find(params[:product_id])

    @product.avatar.attach(params[:avatar])
    redirect_to(product_path(@product))
  end

end
