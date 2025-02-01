require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:user) { create(:user) }
  let(:cart) { create(:cart, user: user) }
  let(:product1) { create(:product, price: 100) }
  let(:product2) { create(:product, price: 200) }
  
  describe '#total_price' do
    it 'calculates the correct total price of the cart' do
      create(:cart_item, cart: cart, product: product1, quantity: 2) 
      create(:cart_item, cart: cart, product: product2, quantity: 1) 

      expect(cart.total_price).to eq(400)
    end

    it 'returns 0 if the cart is empty' do
      expect(cart.total_price).to eq(0)
    end

    it 'handles products with a price of 0' do
      free_product = create(:product, price: 0)
      create(:cart_item, cart: cart, product: free_product, quantity: 3)

      expect(cart.total_price).to eq(0) 
    end
  end

  describe '#finalize_cart!' do
    it 'sets the status to finalized' do
      expect(cart.status).not_to eq('finalized')
      cart.finalize_cart!
      expect(cart.reload.status).to eq('finalized')
    end

    it 'does not change status if already finalized' do
      cart.update(status: 'finalized')
      expect { cart.finalize_cart! }.not_to change { cart.status }
    end
  end

  describe 'validations' do
    it 'is valid with a user' do
      expect(cart).to be_valid
    end

    it 'is invalid without a user' do
      cart_without_user = build(:cart, user: nil)
      expect(cart_without_user).to_not be_valid
    end
  end

  describe 'associations' do
    it 'deletes associated cart_items when the cart is destroyed' do
      create(:cart_item, cart: cart, product: product1, quantity: 1)
      create(:cart_item, cart: cart, product: product2, quantity: 1)

      expect { cart.destroy }.to change { CartItem.count }.by(-2)
    end
  end
end