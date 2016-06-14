class API::PaymentCardsController < API::APIController
  before_action :set_payment_card, only: [:update, :destroy]

  def index
    @payment_cards = current_user.payment_cards
  end

  def create
    @payment_card = current_user.payment_cards.build(payment_card_params)

    if @payment_card.save
      render :show, status: :created
    else
      render json: @payment_card.errors, status: 422
    end
  end

  def destroy
    @payment_card.destroy
    head :no_content
  end

  private

  def set_payment_card
    @payment_card = PaymentCard.find(params[:id])
  end

  def payment_card_params
    params.require(:payment_card).permit(:number, :holder, :rebill_anchor)
  end
end
