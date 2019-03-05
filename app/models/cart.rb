class Cart < ApplicationRecord

  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products
  
  def payable_amount
    self.products.sum {|product| product.price}
  end
  
end
