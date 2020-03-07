class OrdersController < ApplicationController
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

  def complete
  end


  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    service_id = payment.metadata.service_id
    user_id = payment.metadata.user_id
    p "service id #{service_id}"
    p "user id #{user_id}"
    render plain: "Success"
  end
 
end
