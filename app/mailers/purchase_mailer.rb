class PurchaseMailer < ApplicationMailer
  def new_purchase(purchase)
    @purchase = purchase
    @order = purchase.order
    mail(to: Rails.application.secrets.notification_email)
  end
end
