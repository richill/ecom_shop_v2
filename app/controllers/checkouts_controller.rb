class CheckoutsController < ApplicationController
  def create
    stripe_secret_key = ENV["ST_ART_STRIPE_API_KEY_TEST"]
    Stripe.api_key = stripe_secret_key
    cart = params[:cart]
    line_items = cart.map do |item|
      product = Product.find(item["id"])
      product_stock = product.variants.find{ |ps| ps.colour == item["colour"] }

      # if customer is trying to order more than what we have in stock (product_stock.stock ) we will return an error message
      if product_stock.stock < item["quantity"].to_i
        render json: { error: "Not enough stock for #{product.name} in colour #{item["colour"]}. Only #{product_stock.stock} left." }, status: 400
        return
      end

      # if customer orders and we have the items in stock we will fulfill the order
      {
        quantity: item["quantity"].to_i,
        price_data: {
          product_data: {
            name: item["name"],
            metadata: { product_id: product.id, colour: item["colour"], product_stock_id: product_stock.id }
          },
          currency: "gbp",
          unit_amount: (item["price"]*100)
        }
      }
    end

    puts "line_items: #{line_items}"

    session = Stripe::Checkout::Session.create(
      mode: "payment",
      line_items: line_items,
      success_url: "http://localhost:3000/success",
      cancel_url: "http://localhost:3000/cancel",
      shipping_address_collection: {
        allowed_countries: ['US', 'CA']
      }
    )

    render json: { url: session.url }
  end

  def success
    render :success
  end

  def cancel
    render :cancel
  end
end
