class AddLineItemToDeliveries < ActiveRecord::Migration[5.0]
  def change
    add_reference :deliveries, :line_item, foreign_key: true
  end
end
