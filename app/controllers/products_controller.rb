class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, only: %i[ new edit update destroy ]
  impressionist :actions=>[:show]

  def index
    # @products = Product.all
    # @products = Product.order(impressions_count: :desc)
    # impressionist_count(filter: :ip_address)
    @products = Product.order(impressions_count: :desc)
  end

  def show
    @user = current_user
    @admin = current_admin
    impressionist(@product)
  end

  def new
    @admin = current_admin
    @product = @admin.products.build
  end

  def edit
  end

  def create
    @admin = current_admin
    @product = @admin.products.create(product_params)

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
      params.require(:product).permit(
        :name,
        :image_url,
        :user_id,
        :admin_id,
        :price,
        :impressions_count,
        :category_productitemtype_id,
        :category_productstyle_id,
        :category_productsubtype_id,
        :category_producttype_id)
    end
end
