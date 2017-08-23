class ChargesController < ApplicationController

def create
  @order = Order.find(session[:order_id])

  # Amount in cents
  @amount = @order.total.to_i

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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
