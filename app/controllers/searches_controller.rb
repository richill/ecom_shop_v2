class SearchesController < ApplicationController
  def show
    @products = ProductSearch.call(params)
    respond_to do |format|
      form.turbo_stream {
        render turbo_stream: turbo_stream.replace(
          "products_display",
          partial: "products/display",
          locals: { products: @products }
        )
      }
    end
  end
end
