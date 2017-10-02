# Preview all emails at http://localhost:3000/rails/mailers/purchase_mailer
class PurchaseMailerPreview < ActionMailer::Preview
  def new_purchase
    purchase = Purchase.first
    PurchaseMailer.new_purchase(purchase)
  end
end
