class Order < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :user
  belongs_to :cart

  validates :total, presence: true
  validates :status, presence: true

  STATUSES = ["pending", "done", "canceled"]

  def calculate_total
    self.total = cart.cart_items.sum { |item| item.product.price * item.quantity }
  end
end
