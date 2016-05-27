class API::ProductsController < ApplicationController
  def index
    @product_type = ProductType.find(params[:product_type_id])
    @products = @product_type.products
  end

  def show
    @product = Product.find(params[:id])
  end
end
