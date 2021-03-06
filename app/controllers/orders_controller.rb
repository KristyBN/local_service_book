class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  # new order created using Stripe with confirmation
  def new
    @service = Service.find(params[:service_id])
    @session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @service.service_offered,
      description: "#{@service.description}",
      amount: (@service.hourly_rate * 100).to_i,
      currency: 'aud',
      quantity: 1,
    }],
    payment_intent_data: {
      metadata: {
        user_id: current_user.id,
        service_id: @service.id
      }
    },
    success_url: "#{root_url}orders/complete",
    cancel_url: "#{root_url}",
    )
  end
  # sends to completion page
  def complete
  end
  # shows user list of ordered services
  def my_order
    @my_order = Order.where(user_id: current_user.id) 
  end

  # webhook to complete and register payment with Stripe gives confirmation
  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    service_id = payment.metadata.service_id
    user_id = payment.metadata.user_id
    p "service id #{service_id}"
    p "user id #{user_id}"
    order = Order.new(user_id: user_id, service_id: service_id)
    order.save!
    render plain: "Success"
  end


 
end
