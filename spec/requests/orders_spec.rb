require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:user) { create(:user) }
  let!(:cart) { create(:cart, user: user, status: "active") } 
  let!(:product) { create(:product) }
  let!(:cart_item) { create(:cart_item, cart: cart, product: product, quantity: 1) }

  before { sign_in user } 

  describe "GET /orders/:id" do
    let!(:order) { create(:order, user: user, cart: cart) }

    it "exibe a página do pedido" do
      get order_path(order)
      expect(response).to have_http_status(:success)
    end
  end
end