class API::ExchangesController < API::APIController
  before_action :set_purchase, only: [:create]

  def create
    @exchange = @purchase.exchanges.build(exchange_params)

    if @exchange.save
      ExchangeMailer.new_exchange(@exchange).deliver
      render :show, status: :created
    else
      render json: @exchange.errors, status: 422
    end
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:purchase_id])
  end

  def exchange_params
    params.require(:exchange).permit(:program_id).merge(user: current_user)
  end
end
