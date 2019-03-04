class Product < ApplicationRecord
  
  has_many :cart_products
  has_many :carts, through: :cart_products

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }
  validates :image_url, presence: true

end