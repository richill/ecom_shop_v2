class FavoriteProductsController < ApplicationController
  before_action :set_product
  def create
    if Favorite.create(favorited: @product, user: current_user)
      redirect_to products_url, notice: 'Product has been favorited'
    else
      redirect_to products_url, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @product.id, user_id: current_user.id).first.destroy
    redirect_to products_url, notice: 'Product is no longer in favorites'
  end

  private
  def set_product
    @product = Product.find(params[:product_id] || params[:id])
  end
end
