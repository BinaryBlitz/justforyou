class AddPaidToDeliveries < ActiveRecord::Migration[5.0]
  def change
    add_column :deliveries, :paid, :boolean, default: false
  end
end
