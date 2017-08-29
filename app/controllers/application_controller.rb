class ApplicationController < ActionController::Base
  before_action :get_order
  after_action :reset_order_if_payed, only: :get_order
  helper ApplicationHelper
  protect_from_forgery with: :exception

  private
  def get_order
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create
      session[:order_id] = @order.id
    end
  end

  def reset_order_if_payed
    @order = Order.create if @order.payed
  end
end
