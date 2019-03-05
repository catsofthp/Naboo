class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  after_action :add_product_to_cart_from_product_page, only: [:create]
  respond_to :html, :js

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @products = Product.all
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    if current_user.cart == nil
      @cart = Cart.create!(user: current_user)
    end
    redirect_to product_path(params[:product_id])
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json

  # LES NOTICE / FLASH NE MARCHENT PAS. A ADAPTER A AJAX

  def update
    @products = Product.all
    if params[:to_do] == "add" then current_user.cart.add_product(Product.find(params[:product_id])) end
    if params[:to_do] == "remove" then current_user.cart.remove_product(Product.find(params[:product_id])) end
    redirect_to cart_path(@cart)
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
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
