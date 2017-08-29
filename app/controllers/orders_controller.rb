class OrdersController < ApplicationController
  helper ApplicationHelper

  def create
    dish = Dish.find(params[:dish_id])
    get_order.add(dish, dish.price)
    flash[:notice] = "#{dish.title} was successfully added to order!"

    redirect_to request.referer
  end

  def show
    @order = get_order
  end

  def destroy
    dish = Dish.find(params[:dish_id])
    dish_title = dish.title
    get_order.remove(dish)
    flash[:notice] = "#{dish_title} was successfully removed from order!"

    redirect_to order_path(get_order)
  end

end
