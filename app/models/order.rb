class Order < ApplicationRecord

  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  
  def payable_amount
    self.products.sum {|product| product.price}
  end

end
