class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    if api_params[:import_type] == 'zip'
      create_import_lote
    else
      @service = Importers::IndividualCreate.new(api_params[:file].read, api_params[:file].original_filename)
      @service.call
    end

    # TaskFixFormattingJob.perform_later
  end

  def create_import_lote
    @document_lote = api_params[:file]
    
    temp_file_path = Rails.root.join('tmp', @document_lote.original_filename)
    File.open(temp_file_path, 'wb') do |file|
      file.write(@document_lote.read)
    end
  
    ImporterLotesXmlJob.perform_later(temp_file_path.to_s)
  end

  def export
    @orders = Order.includes(:user, :cart).all

    @report_data = @orders.map do |order|
      cart_items = order.cart.cart_items.map do |cart_item|
        {
          product_name: cart_item.product.name.to_s.strip,
          quantity: cart_item.quantity,
          unit_price: cart_item.product.price.to_f,
          total_price: (cart_item.product.price * cart_item.quantity).to_f
        }
      end

      {
        order_id: order.id,
        user_name: order.user&.name.to_s.strip,
        user_email: order.user&.email.to_s.strip,
        total: order.total.to_f,
        status: order.status.to_s.strip,
        created_at: order.created_at.strftime("%d/%m/%Y %H:%M"),
        cart_items: cart_items
      }
    end

    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = 'attachment; filename="orders_export.xlsx"'
        render xlsx: 'export'  
      end
    end
  end

  private

  def api_params
    params.to_unsafe_h || {}
  end
end
