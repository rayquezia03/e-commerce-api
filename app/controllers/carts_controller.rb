class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:update_item]

  def show
    @cart = find_or_create_cart
    @cart_items = @cart.cart_items.includes(:product)
  end

  def add_item
    cart = find_or_create_cart 
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    quantity = quantity > 0 ? quantity : 1

    cart_item = cart.cart_items.find_or_initialize_by(product: product)

    cart_item.quantity = cart_item.quantity.to_i + quantity

    if cart_item.save
      render json: { success: true, message: "Produto adicionado ao carrinho!" }
    else
      render json: { success: false, errors: cart_item.errors.full_messages }
    end
  end

  def update_item
    @cart_item = CartItem.find(params[:id])
    new_quantity = cart_item_params[:quantity].to_i
    product = @cart_item.product
  
    if new_quantity > product.stock_quantity
      render json: { success: false, errors: ["Estoque insuficiente. Apenas #{product.stock_quantity} disponíveis."] }, status: :unprocessable_entity
    else
      if @cart_item.update(cart_item_params)
        render json: { success: true, message: "Item atualizado com sucesso!" }
      else
        render json: { success: false, errors: @cart_item.errors.full_messages }
      end
    end
  end

  def remove_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    render json: { success: true }
  end

  def finalize
    @cart = find_or_create_cart
    @order = Order.new(user: current_user, cart: @cart, status: "pending")
    @order.calculate_total 

    @cart.cart_items.each do |cart_item|
      p '----------------'
      p cart_item
      product = cart_item.product
      p product
      new_quantity = product.stock_quantity - cart_item.quantity
      if new_quantity.negative?
        raise ActiveRecord::Rollback, "Estoque insuficiente para #{product.name}!"
      end
      product.update!(stock_quantity: new_quantity)
    end

    if @order.save       
      @cart.update!(status: "Finalizado")
      new_cart = Cart.create(user: current_user, status: :active)
      session[:cart_id] = new_cart.id
      @order.update(status: "done")

      redirect_to order_path(@order), notice: "Compra realizada com sucesso!"
    else
      redirect_to cart_path(@cart), alert: "Houve um erro ao finalizar a compra."
    end
  end

  private

  def find_or_create_cart
    cart = current_user.carts.where(status: 'active').last
  
    cart ||= current_user.carts.create(status: 'active')
  
    return cart
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id]) 
  end
end
