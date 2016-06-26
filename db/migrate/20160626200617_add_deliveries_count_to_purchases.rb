class AddDeliveriesCountToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :deliveries_count, :integer, default: 0
  end
end
