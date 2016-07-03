class CreateBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :balances do |t|
      t.integer :lower_days_regular_threshold, default: 31
      t.integer :upper_days_regular_threshold, default: 101
      t.integer :lower_percentage_regular_threshold, default: 5
      t.integer :upper_percentage_regular_threshold, default: 10
      t.integer :lower_days_periodic_threshold, default: 101
      t.integer :balance_period, default: 100
      t.integer :periodic_balance_sum, default: 15_000
      t.timestamps
    end
  end
end
