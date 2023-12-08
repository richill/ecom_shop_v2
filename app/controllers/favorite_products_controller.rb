class FavoriteProductsController < ApplicationController
  before_action :set_product
  def create
    respond_to do |format|
      if Favorite.create(favorited: @product, user: current_user)
        # redirect_to products_url, notice: 'Product has been favorited'
        format.html { redirect_to products_url, notice: "Product has been favorited" }
        format.js
      else
        # redirect_to products_url, alert: 'Something went wrong...*sad panda*'
        format.html { redirect_to products_url, alert: "Something went wrong...*sad panda*" }
        format.js
      end
    end
  end

  def destroy
    Favorite.where(favorited_id: @product.id, user_id: current_user.id).first.destroy
    respond_to do |format|
      # redirect_to products_url, notice: 'Product is no longer in favorites'
      format.html { redirect_to products_url, alert: "Product is no longer in favorites" }
      format.js
    end
  end

  private
  def set_product
    @product = Product.find(params[:product_id] || params[:id])
  end
end
