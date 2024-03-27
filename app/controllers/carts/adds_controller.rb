module Carts
  class AddsController < ApplicationController
    before_action :authenticate_user!

    # ----create----
    def create
      if product_found?
        cart_item = current_cart.cart_items.find_or_initialize_by(product_id: params[:product])
        cart_item.quantity += 1
        cart_item.save
      end
    end
    # ----create----


    private

    # ----method----
    def product_found?
      Product.exist?(params[:product])
    end
    # ----method----
  end
end
