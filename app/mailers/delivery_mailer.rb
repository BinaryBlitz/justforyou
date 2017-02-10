class DeliveryMailer < ApplicationMailer
  def new_delivery(purchase)
    @purchase = purchase
    @deliveries = purchase.deliveries
    mail(to: 'info@justforyou.ru')
  end

  def cancel(delivery)
    @delivery = delivery
    mail(to: 'info@justforyou.ru')
  end
end
