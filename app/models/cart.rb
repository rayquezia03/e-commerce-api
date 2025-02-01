class Cart < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  validates :user, presence: true 

  def total_price
    cart_items.sum { |item| item.product.price * item.quantity }
  end

  def finalize_cart!
    update(status: :finalized)
  end
end