class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @admin = current_admin
    @order = @admin.orders.build
  end

  def edit
    @admin = current_admin
  end

  def create
    @admin = current_admin
    @order = @admin.orders.create(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to admin_order_path(@order.admin, @order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to admin_order_path(@order.admin, @order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin = current_admin
    @order.destroy

    respond_to do |format|
      format.html { redirect_to listed_orders_admin_path(@admin), notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:customer_email, :fulfilled, :total, :address, :admin_id)
    end
end
