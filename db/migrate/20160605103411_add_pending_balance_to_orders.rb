class AddPendingBalanceToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :pending_balance, :integer, default: 0
  end
end
