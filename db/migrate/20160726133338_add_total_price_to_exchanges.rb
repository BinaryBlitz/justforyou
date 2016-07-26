class AddTotalPriceToExchanges < ActiveRecord::Migration[5.0]
  def change
    add_column :exchanges, :total_price, :integer
  end
end
