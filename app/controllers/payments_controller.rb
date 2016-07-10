class PaymentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_response, only: [:success]

  def success
    @payment = Payment.find(@response.order_id)
    @payment.paid!(payment_card_params) if @response.valid_payment? && !@payment.paid?

    logger.debug("Payment #{@payment.id}: success callback")

    head :ok
  end

  def fail
    logger.debug(params)
    head :ok
  end

  private

  def set_response
    @response = Payonline::PaymentResponse.new(params)
  end

  def payment_card_params
    {
      rebill_anchor: params['RebillAnchor'],
      holder: params['CardHolder'],
      number: params['CardNumber']
    }
  end
end
