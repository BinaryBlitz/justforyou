class API::PaymentsController < API::APIController
  before_action :set_order, only: [:create]

  def index
    @payments = current_user.payments.paid
  end

  def create
    @payment = @order.payment || @order.create_payment(payment_card: payment_card)
    render status: :created
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def payment_params
    params.fetch(:payment, {}).permit(:payment_card_id)
  end

  def payment_card
    return unless payment_params[:payment_card_id].present?
    current_user.payment_cards.find(payment_params[:payment_card_id])
  end
end
