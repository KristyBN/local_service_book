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

#  def index
 #   @order = current_user.services
  #end
  
#  def self.contains?(current_user, service)
 #   return current_user.services.where(id: service.id).length > 0
  #end

  #def self.create_order(current_user, service)
   # if current_user.services.where(id: service.id).length == 0
    #  current_user.services.push(service)
     # current_user.save
   # end
 # end

# def self.order(current_user, service)
  #  return Order.where("service_id = ? AND user_id", service, current_user.id).first.id
 # end


  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    service_id = payment.metadata.service_id
    user_id = payment.metadata.user_id
    p "service id #{service_id}"
    p "user id #{user_id}"
    # order = Order.new(user_id: user_id, service_id: service_id)
    # order.save
    render plain: "Success"
  end


 
end
