class OrdersController < ApplicationController
  before_action :get_referer

  def create
    dish = Dish.find(params[:dish_id])
    @order.add(dish, dish.price)
    flash[:notice] = "#{dish.title} was successfully added to order!"

    redirect_to session.delete(:return_to)
  end

  def show
    @order_items = @order.shopping_cart_items
  end

  def destroy
    dish = Dish.find(params[:dish_id])
    dish_title = dish.title
    @order.remove(dish)
    flash[:notice] = "#{dish_title} was successfully removed from order!"

    redirect_to session.delete(:return_to)
  end

  private
  def get_referer
    session[:return_to] ||= request.referer
  end
end
