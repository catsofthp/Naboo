class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  after_action :add_product_to_cart_from_product_page, only: [:create]
  respond_to :html, :js

  def show
    @products = Product.all
  end

  def create
    if current_user.cart == nil
      @cart = Cart.create!(user: current_user)
    end
    redirect_to product_path(params[:product_id])
  end

  def update
    @products = Product.all
    if params[:to_do] == "add" then current_user.cart.add_product(Product.find(params[:product_id])) end
    if params[:to_do] == "remove" then current_user.cart.remove_product(Product.find(params[:product_id])) end
    if params[:to_do] == "delete" then current_user.cart.products.where(id: params[:product_id]).count.times {current_user.cart.remove_product(Product.find(params[:product_id]))} end
    redirect_to cart_path(@cart)
  end

  def add_product_to_cart_from_product_page
    CartProduct.create!(cart: current_user.cart, product: Product.find(params[:product_id]))
    flash[:success] = "Product added to cart"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find_by(user: current_user)
  end

end
