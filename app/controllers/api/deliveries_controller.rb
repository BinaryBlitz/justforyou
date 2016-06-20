class API::DeliveriesController < API::APIController
  before_action :set_delivery, only: [:cancel]
  before_action :set_purchase, only: [:create]

  def index
    @deliveries = current_user.deliveries
  end

  def create
    @deliveries = @purchase.deliveries.create(deliveries_params[:deliveries])
    invalid_delivery = @deliveries.find(&:invalid?)

    if invalid_delivery.present?
      render json: invalid_delivery.errors, status: 422
    else
      render :index, status: :created
    end
  end

  def cancel
    authorize @delivery
    @delivery.canceled!
    head :ok
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:purchase_id])
  end

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def deliveries_params
    params.permit(deliveries: [:scheduled_for, :address_id, :comment])
  end
end
