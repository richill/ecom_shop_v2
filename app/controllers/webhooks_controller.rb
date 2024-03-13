class WebhooksController < ApplicationController
  skip_forgery_protection

  def stripe
    stripe_secret_key = ENV["ST_ART_STRIPE_API_KEY_TEST"]
    Stripe.api_key = stripe_secret_key
    payload = request.body.read
    sig_header = request.env["HTTP_STRIPE_SIGNATURE"]
    endpoint_secret = ENV["ST_ART_STRIPE_WEBHOOK_SECRET_TEST"]
    event = nil

    # -------- begin --------
    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      puts "Webhook signature verification failed."
      status 400
      return
    end
    # -------- begin --------

    # -------- handle the event --------
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      shipping_details = session["shipping_details"]
      puts "Session: #{session}"
      if shipping_details
        address = "#{shipping_details['address']['line1']} #{shipping_details['address']['city']}, #{shipping_details['address']['state']} #{shipping_details["address"]["postal_code"]}"
      else
        address = ""
      end
      order = Order.create!(customer_email: session["customer_details"]["email"], total: session["amount_total"], address: address, fulfilled: false)
      full_session = Stripe::Checkout::Session.retrieve({ id: session.id, expand: ['line_items'] })
      line_items = full_session.line_items
      line_items["data"].each do |item|
        product = Stripe::Product.retrieve(item["price"]["product"])
        product_id = product["metadata"]["product_id"].to_i
        OrderProduct.create!(order: order, product_id: product_id, quantity: item["quantity"], colour: product["metadata"]["colour"])
        Variant.find(product["metadata"]["product_stock_id"]).decrement!(:stock, item["quantity"])
      end
    else
      puts "Unhandled event type: #{event.type}"
    end
    # -------- handle the event --------

    render json: { message: 'success' }
  end
end






# class WebhooksController < ApplicationController
#   skip_forgery_protection
#
#   def stripe
#     stripe_secret_key = ENV["ST_ART_STRIPE_API_KEY_TEST"]
#     Stripe.api_key = stripe_secret_key
#     payload = request.body.read
#     sig_header = request.env["HTT_STRIPE_SIGNATURE"]
#     binding.pry
#     endpoint_secret = ENV["ST_ART_STRIPE_WEBHOOK_SECRET_TEST"]
#     event = nil
#
#     # -------- begin --------
#     begin
#       event = Stripe::Webhook.construct_event(
#         payload, sig_header, endpoint_secret
#       )
#     rescue JSON::ParserError => e
#       # Invalid payload
#       status 400
#       return
#     rescue Stripe::SignatureVerificationError => e
#       # Invalid signature
#       puts "Webhook signature verification failed."
#       status 400
#       return
#     end
#     # -------- begin --------
#
#
#     # -------- handle the event --------
#     case event.type
#     when 'checkout.session.completed'
#       session = event.data.object
#       shipping_details = session["shipping_details"]
#       puts "Session: #{session}"
#       if shipping_details
#         address = "#{shipping_details['address']['line1']} #{shipping_details['address']['city']}, #{shipping_details['address']['state']} #{shipping_details["address"]["postal_code"]}"
#       else
#         address = ""
#       end
#       order = Order.create!(customer_email: session["customer_details"]["email"], total: session["amount_total"], address: address, fulfilled: false)
#       full_session = Stripe::Checkout::Session.retrieve({ id: session.id, expand: ['line_items'] })
#       line_items = full_session.line_items
#       line_items["data"].each do |item|
#         product = Stripe::Product.retrieve(item["price"]["product"])
#         product_id = product["metadata"]["product_id"].to_i
#         OrderProduct.create!(order: order, product_id: product_id, quantity: item["quantity"], colour: product["metadata"]["colour"])
#         Variant.find(product["metadata"]["product_stock_id"]).decrement!(:stock, item["quantity"])
#       end
#     else
#       puts "Unhandled event type: #{event.type}"
#     end
#
#     render json: { message: 'success' }
#     status 200
#     # -------- handle the event --------
#   end
# end
