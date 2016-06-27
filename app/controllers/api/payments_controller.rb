class API::PaymentsController < API::APIController
  before_action :set_payable, only: [:create]

  def index
    @payments = current_user.payments.paid
  end

  def create
    @payment = @payable.payment || @payable.create_payment(payment_card: payment_card)
    render status: :created
  end

  private

  def set_payable
    @payable = if params[:order_id].present?
      Order.find(params[:order_id])
    elsif params[:exchange_id].present?
      Exchange.find(params[:exchange_id])
    end
  end

  def payment_params
    params.fetch(:payment, {}).permit(:payment_card_id)
  end

  def payment_card
    return unless payment_params[:payment_card_id].present?
    current_user.payment_cards.find(payment_params[:payment_card_id])
  end
end
