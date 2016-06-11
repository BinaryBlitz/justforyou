class Admin::DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:cancel]

  def cancel
    @delivery.canceled!
    redirect_to admin_users_path, notice: 'Заказ был успешно отменен.'
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end
end
