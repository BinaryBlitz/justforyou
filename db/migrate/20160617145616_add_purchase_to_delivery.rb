class AddPurchaseToDelivery < ActiveRecord::Migration[5.0]
  def change
    add_reference :deliveries, :purchase, foreign_key: true
  end
end
