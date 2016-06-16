class PaymentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_response, only: [:success]

  def success
    @payment = Payment.find_by!(order_id: @response.order_id)

    if @response.valid_payment?
      @payment.paid!
      logger.debug("Payment: ")
    end

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
end
