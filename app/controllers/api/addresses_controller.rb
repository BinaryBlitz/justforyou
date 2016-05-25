class API::AddressesController < API::APIController
  def index
    @addreses = current_user.addresses
  end

  def show
    @address = Address.find(params[:id])
  end

  def create
    @address = current_user.addresses.build(order_params)

    if @address.save
      render :show, status: :created
    else
      render json: @address.errors, status: 422
    end
  end

  private

  def order_params
    params.require(:address).permit(:content, :floor, :entrance)
  end
end
