class API::DeliveriesController < API::APIController
  before_action :set_delivery, only: [:cancel]

  def cancel
    authorize @delivery
    @delivery.canceled!
    head :ok
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end
end
