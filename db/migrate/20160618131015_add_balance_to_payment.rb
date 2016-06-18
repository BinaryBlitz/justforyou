class AddBalanceToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :balance, :boolean, default: true
  end
end
