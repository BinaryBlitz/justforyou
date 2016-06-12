class RemoveOrderFromDeliveries < ActiveRecord::Migration[5.0]
  def change
    remove_reference :deliveries, :order, foreign_key: true
  end
end
