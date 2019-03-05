class Order < ApplicationRecord

  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  
  def payable_amount
    self.products.sum {|product| product.price}
  end

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
