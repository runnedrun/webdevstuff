class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  PAYMENT_TYPES = ["Check", "Credit Card", "Purchase order", "Blood","Sugar", "Sex", "Magick"]
  validates :name, :adress, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
end
