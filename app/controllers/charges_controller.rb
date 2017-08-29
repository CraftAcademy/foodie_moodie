class ChargesController < ApplicationController

  before_action :get_order
  before_action :update_order_details, only: :create
  before_action :redirect_back_on_missing_info, only: :create

  def create
    # Amount in cents
    @amount = (@order.total * 100).to_i

    customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Order ' + @order.id.to_s,
        currency: 'sek'
    )

    @amountpaid = @order.total
    set_delivery_info
    session[:order_id] = @order.id

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to order_path(@order)
  end

  def update_order_details
    @order.name = params[:name]
    @order.address_1 = params[:address_1] || ''
    @order.address_2 = params[:address_2] || ''
    @order.postal_code = params[:postal_code]
    @order.city = params[:city]
    @order.phone_number = params[:phone_number]
    @order.email = params[:email]

  end

  def redirect_back_on_missing_info
    if @order.name.nil? || @order.name.empty?
      flash[:error] = 'Customer information is missing'
      redirect_to order_path(@order)
    end
  end


  def set_delivery_info
    @delivery_info = @order.name + ' ' + @order.address_1 + ' ' + @order.address_2 + ' ' + @order.postal_code + ' ' + @order.city
  end

end
