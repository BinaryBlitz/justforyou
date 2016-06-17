class API::ProductTypesController < API::APIController
  def index
    @product_types = ProductType.all.includes(:products)
  end

  def show
    @product_type = ProductType.find(params[:id])
  end
end
