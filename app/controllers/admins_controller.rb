class AdminsController < ApplicationController
  before_action :set_admin, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!

  def dashboard
    #dashboard
  end

  def product
    @products = Product.order_desc.all
  end

  def variant
    @variants = Variant.order_desc.all
  end

  def listed_orders
    @orders = Order.order_asc
    @not_fulfilled_orders = Order.unfulfilled_orders.order_asc
    @fulfilled = Order.fulfilled_orders.order_asc
  end

  def customers
    @users = User.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def admin_params
    params.require(:admin).permit(:email)
  end
end
