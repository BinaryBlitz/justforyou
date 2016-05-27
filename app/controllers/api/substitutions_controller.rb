class API::SubstitutionsController < API::APIController
  def index
    @substitution = current_user.substitutions
  end

  def create
    @substitution = current_user.substitutions.build(substitution_params)
    @substitution.product = Product.find(params[:product_id])
    if @substitution.save
      render :show, status: :created
    else
      render json: @substitution.errors, status: 422
    end
  end

  def destroy
    @substitution = Substitution.find(params[:id])
    @substitution.destroy
    head :no_content
  end

  private

  def substitution_params
    params.require(:substitution).permit(:product_id)
  end
end
