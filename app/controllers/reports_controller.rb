class ReportsController < ApplicationController
  def index
    @orders = get_order_reports

    @status_options = FiltersService.status_options || []
    @user_options = FiltersService.user_options || []
  end

  private

  def get_order_reports
    query = Order.includes(:user) 

    excluded_keys = ["commit", "controller", "action"]
    
    filtered_params = params.to_unsafe_h.each_with_object({}) do |(key, value), hash|
      hash[key] = value unless excluded_keys.include?(key) || value.nil? || value.strip.empty?
    end

    filtered_params.each do |key, value|
      query = query.where(key => value) if value.present?
    end

    filtered_orders = query

    reports = filtered_orders.map do |order|
      {
        order: order,
        user: order.user 
      }
    end

    reports
  end

  # def reset_history_orders
  #   Order.delete_all

  #   redirect_to reports_path
  # end
end
