class API::SubstitutionsController < API::APIController
  before_action :set_product, only: [:create]
  before_action :set_substitution, only: [:destroy]

  def index
    @substitutions = current_user.substitutions
  end

  def create
    @substitution = current_user.substitutions.build(product: @product)
    authorize @substitution

    if @substitution.save
      render :show, status: :created
    else
      render json: @substitution.errors, status: 422
    end
  end

  def destroy
    @substitution.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_substitution
    @substitution = Substitution.find(params[:id])
  end
end
