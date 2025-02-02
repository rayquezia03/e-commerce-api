class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart = current_user.carts
    @order = Order.new(user: current_user, cart: @cart, status: "pending")
    @order.calculate_total 

    if @order.save
      @cart.update(status: "completed")
      
      redirect_to order_path(@order), notice: "Compra realizada com sucesso!"
    else
      redirect_to cart_path(@cart), alert: "Houve um erro ao finalizar a compra."
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end