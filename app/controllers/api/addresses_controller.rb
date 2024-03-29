class API::AddressesController < API::APIController
  before_action :set_address, only: [:show, :destroy]

  def index
    @addresses = current_user.addresses
  end

  def show
  end

  def create
    @address = current_user.addresses.build(order_params)

    if @address.save
      render :show, status: :created
    else
      render json: @address.errors, status: 422
    end
  end

  def destroy
    if @address.deliveries.any?
      @address.update(deleted_at: Time.zone.now)
    else
      @address.destroy
    end
    head :no_content
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def order_params
    params
      .require(:address)
      .permit(:content, :floor, :entrance, :house, :apartment, :latitude, :longitude)
  end
end
