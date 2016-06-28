class AddDeliveryInvoiceToDeliveries < ActiveRecord::Migration[5.0]
  def change
    add_reference :deliveries, :delivery_invoice
  end
end
