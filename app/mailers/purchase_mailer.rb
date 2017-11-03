class PurchaseMailer < ApplicationMailer
  def new_purchase(purchase)
    @purchase = purchase
    @order = purchase.order
    @deliveries = purchase.deliveries.where('updated_at > ?', 1.hour.ago)
    mail(to: Rails.application.secrets.notification_email)
  end
end
