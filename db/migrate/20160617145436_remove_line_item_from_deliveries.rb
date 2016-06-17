class RemoveLineItemFromDeliveries < ActiveRecord::Migration[5.0]
  def change
    remove_reference :deliveries, :line_item, foreign_key: true
  end
end
