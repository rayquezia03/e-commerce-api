require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product, name: "Produto Teste", price: 100, stock_quantity: 10, section: "Categoria A") }

  describe 'associations' do
    it { should have_one_attached(:image) }
  end

  describe 'creating product with invalid attributes' do
    it 'is not valid without a name' do
      product = Product.new(price: 100, stock_quantity: 10, section: "Categoria A")
      expect(product).not_to be_valid
    end

    it 'is not valid without a price' do
      product = Product.new(name: "Produto Teste", stock_quantity: 10, section: "Categoria A")
      expect(product).not_to be_valid
    end

    it 'is not valid without a section' do
      product = Product.new(name: "Produto Teste", price: 100, stock_quantity: 10)
      expect(product).not_to be_valid
    end

    it 'is not valid if stock_quantity is negative' do
      product = Product.new(name: "Produto Teste", price: 100, stock_quantity: -1, section: "Categoria A")
      expect(product).not_to be_valid
    end
  end
end