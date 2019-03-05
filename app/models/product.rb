class Product < ApplicationRecord
  
  has_many :cart_products
  has_many :carts, through: :cart_products
  has_many :order_products
  has_many :orders, through: :order_products
  has_one_attached :avatar

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }

end