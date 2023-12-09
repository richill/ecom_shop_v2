class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  impressionist :actions=>[:show]
  before_action :authenticate_user!

  def index
    # @products = Product.all
    # @products = Product.order(impressions_count: :desc)
    @products = Product.order(impressions_count: :asc)
  end

  def show
    @user = current_user
    impressionist(@product)
  end

  def new
    # @product = Product.new
    @user = current_user
    @product = @user.products.build
  end

  def edit
  end

  def create
    # @product = Product.new(product_params)
    @user = current_user
    @product = @user.products.create(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :image, :image_url, :user_id, :price, :impressions_count)
    end
end
