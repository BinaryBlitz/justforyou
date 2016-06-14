class PaymentsController < ApplicationController
  protect_from_forgery with: :null_session

  def success
    logger.debug(params)
    head :ok
  end

  def fail
    logger.debug(params)
    head :ok
  end
end
