class API::DeliveriesController < API::APIController
  before_action :set_delivery, only: [:cancel]
  before_action :set_purchase, only: [:create]

  def index
    @deliveries = current_user.deliveries
  end

  def create
    @delivery = @purchase.deliveries.build(delivery_params)

    if @delivery.save
      render :show, status: :created
    else
      render json: @delivery.errors, status: 422
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

  def delivery_params
    params.require(:delivery).permit(:scheduled_for, :address_id)
  end
end
