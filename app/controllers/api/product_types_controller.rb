class API::ProductTypesController < ApplicationController
  def index
    @product_types = ProductType.all.includes(:products)
  end

  def show
    @product_type = ProductType.find(params[:id])
  end
end
