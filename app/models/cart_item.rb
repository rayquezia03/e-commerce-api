class CartItem < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :cart
  belongs_to :product
end