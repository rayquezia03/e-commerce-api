require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { create(:user) }
  let(:cart) { create(:cart, user: user) }
  let(:product1) { create(:product, price: 100, section: "Categoria A") }
  let(:product2) { create(:product, price: 200, section: "Categoria B") }
  let!(:cart_item1) { create(:cart_item, cart: cart, product: product1, quantity: 2) }
  let!(:cart_item2) { create(:cart_item, cart: cart, product: product2, quantity: 1) }
  
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:cart) }
  end
  
  describe '#calculate_total' do
    it 'calculates the correct total from cart items' do
      order = build(:order, user: user, cart: cart, total: nil)
      order.calculate_total
      expect(order.total).to eq(400) # (100*2) + (200*1) = 400
    end

    it 'sets total to 0 when cart has no items' do
      empty_cart = create(:cart, user: user)
      order = build(:order, user: user, cart: empty_cart, total: nil)
      order.calculate_total
      expect(order.total).to eq(0)
    end
  end

  describe 'constants' do
    it 'defines valid statuses' do
      expect(Order::STATUSES).to match_array(["pending", "done", "canceled"])
    end
  end

  describe 'constants' do
    it 'defines valid statuses' do
      expect(Order::STATUSES).to match_array(["pending", "done", "canceled"])
    end
  end
  
end