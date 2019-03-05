class Cart < ApplicationRecord

  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products
  
  def payable_amount
    self.products.sum {|product| product.price}
  end

  def add_product(product)
    CartProduct.create!(cart: self, product: product)
  end

  def remove_product(product)
    if CartProduct.where("cart_id = ? and product_id = ?", self.id, product.id).count >=1
      CartProduct.where("cart_id = ? and product_id = ?", self.id, product.id)[0].destroy
    end
  end
  
end
