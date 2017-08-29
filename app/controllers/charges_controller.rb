class ChargesController < ApplicationController

def create
  @order = Order.find(session[:order_id])

  @order.name = params[:name]
  @order.address1 = params[:address1]
  @order.address2 = params[:address2]
  @order.postal_code = params[:postal_code]
  @order.city = params[:city]
  @order.phone_number = params[:phone_number]
  @order.email = params[:email]

  if @order.name.nil? || @order.name.empty?
    flash[:error] = 'Customer information is missing'
    redirect_to order_path
  else
    # Amount in cents
    @amount = (@order.total * 100).to_i

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       @amount,
      description:  'Order ' + @order.id.to_s,
      currency:     'sek'
    )

    @amountpaid = @order.total
    @delivery_info = @order.name + ' ' + @order.address1 + ' ' + @order.address2 + ' ' + @order.postal_code + ' ' + @order.city
    @order = Order.create
    session[:order_id] = @order.id
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to order_path
  end
end
