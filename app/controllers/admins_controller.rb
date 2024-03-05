class AdminsController < ApplicationController
  before_action :set_admin, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!

  def dashboard
    #dashboard
  end

  def product
    @products = Product.all
  end

  def variant
    @variants = Variant.all
  end

  def listed_orders
    @orders = Order.all
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
