class ChargesController < ApplicationController
	after_action :process_order, only: [:create]

	def new
	end

	def create
		# Amount in cents
		@cart = Cart.find(params[:cart_id])
	  @amount = @cart.payable_amount*100

	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: 'Rails Stripe customer',
	    currency: 'eur',
	  })

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

	def process_order
		@cart = Cart.find(params[:cart_id])
		order = Order.create!(user: current_user)
		@cart.products.each { |product| OrderProduct.create(order: order, product: product) }
		@cart.destroy
	end

end
