class OrdersController < ApplicationController
  before_action :authenticate_user!

  # Cria um pedido e finaliza a compra
  def create
    @cart = current_user.cart
    @order = Order.new(user: current_user, cart: @cart, status: "pending")
    @order.calculate_total # Calcula o total com base nos itens do carrinho

    if @order.save
      # Atualiza o status do carrinho para "completed" após a compra
      @cart.update(status: "completed")
      
      # Redireciona para a página do pedido
      redirect_to order_path(@order), notice: "Compra realizada com sucesso!"
    else
      redirect_to cart_path(@cart), alert: "Houve um erro ao finalizar a compra."
    end
  end

  # Exibe os detalhes de um pedido específico
  def show
    @order = Order.find(params[:id])
  end
end
