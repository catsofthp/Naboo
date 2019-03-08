class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update]
  after_action :add_product_to_cart_from_product_page, only: [:create]

  def show
    @products = Product.all
  end

  def create
    if current_user.cart == nil
      @cart = Cart.create!(user: current_user)
    end
    if params[:origin] == "product_page"
      redirect_back(fallback_location: product_path(params[:product_id]))
    else
      redirect_back(fallback_location: products_path)
    end
  end

  def update
    @products = Product.all
    if params[:to_do] == "add" then current_user.cart.add_product(Product.find(params[:product_id])) end
    if params[:to_do] == "remove" then current_user.cart.remove_product(Product.find(params[:product_id])) end
    if params[:to_do] == "delete" then current_user.cart.products.where(id: params[:product_id]).count.times {current_user.cart.remove_product(Product.find(params[:product_id]))} end
    redirect_back(fallback_location: cart_path(@cart))
  end

  def add_product_to_cart_from_product_page
    CartProduct.create!(cart: current_user.cart, product: Product.find(params[:product_id]))
    flash[:success] = "Chat mignon ajouté au panier"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @products = Product.all
    @cart = Cart.find_by(user: current_user)
  end

end
