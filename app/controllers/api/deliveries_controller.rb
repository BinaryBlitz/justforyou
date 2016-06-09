class API::DeliveriesController < API::APIController
  before_action :set_delivery, only: [:cancel]

  def cancel
    authorize @delivery
    if @delivery.update(delivery_params)
      head :ok
    else
      render json: @delivery.errors, status: 422
    end
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(:status)
  end
end
