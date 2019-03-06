class Order < ApplicationRecord

  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  
  def payable_amount
    self.products.sum {|product| product.price}
  end

  def self.total_price
    sum = 0
    Order.all.each { |order| sum += order.payable_amount }
    return sum
  end

  def self.average_price
    self.total_price/Order.all.count
  end

  after_create :welcome_order
  after_create :welcome_admin

  def welcome_order
    UserMailer.welcome_order(self).deliver_now
  end

  def welcome_admin
    UserMailer.welcome_admin(self).deliver_now
  end
end
