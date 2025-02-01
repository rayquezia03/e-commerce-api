class ProductsController < ApplicationController
    def index
      @products = Product.all

      @products = Product.where('LOWER(name) LIKE ?', "%#{params[:search].downcase}%") if params[:search].present?

      if params[:section].present?
        @products = @products.where(section: params[:section])
      end

      return @products
    end
  
    def show
      @product = Product.find(params[:id])
    end
end  