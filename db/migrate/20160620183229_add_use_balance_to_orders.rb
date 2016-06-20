class AddUseBalanceToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :use_balance, :boolean, default: false
  end
end
