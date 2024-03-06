class AdminsController < ApplicationController
  before_action :set_admin, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!

  def dashboard
    @orders = Order.unfulfilled_orders.order_asc.take(5)
    @quick_stats = {
      # sales
      sales: Order.where(created_at: Time.now.midnight..Time.now).count,

      # revenue
      revenue: Order.where(created_at: Time.now.midnight..Time.now).sum(:total).round(),
      avg_sales: Order.where(created_at: Time.now.midnight..Time.now).average(:total),

      # avg_sales
      avg_sales: Order.where(created_at: Time.now.midnight..Time.now).average(:total),
      # avg_sales: Order.where(created_at: Time.now.midnight..Time.now).average(:total).round(),


      # per_sale
      per_sale: OrderProduct.joins(:order).where(orders: {created_at: Time.now.midnight..Time.now}).average(:quantity)
    }

    #displays orders in the last 7 days
    @orders_by_day = Order.where('created_at > ?', Time.now - 7.days).order(:created_at)

    #group orders by created_at date
    @orders_by_day = @orders_by_day.group_by { |order| order.created_at.to_date }

    #revenue made each day - gives days of the week and money made in each day
    @revenue_by_day = @orders_by_day.map { |day, orders| [day.strftime("%A"), orders.sum(&:total)] }

    #we did not have a full set of data over the last 7 days - we had only 6 days where we made revenue - create condition
    if @revenue_by_day.count < 7
      days_of_week = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
      data_hash = @revenue_by_day.to_h
      current_day = Date.today.strftime("%A") #display day of the week
      current_day_index = days_of_week.index(current_day)
      next_day_index = (current_day_index + 1) % days_of_week.length

      #displays the current day as the last in the array on the graph
      order_days_with_current_last = days_of_week[next_day_index..-1] + days_of_week[0...next_day_index]

      complete_order_array_with_current_last = order_days_with_current_last.map { |day| [day, data_hash.fetch(day, 0)]}

      @revenue_by_day = complete_order_array_with_current_last
    end
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
