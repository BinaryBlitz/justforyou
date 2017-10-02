class AddOrderIdToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :order, foreign_key: true
  end
end
