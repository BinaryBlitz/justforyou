class RenamePriceInPrograms < ActiveRecord::Migration[5.0]
  def change
    rename_column :programs, :first_price, :primary_price
    rename_column :programs, :second_price, :secondary_price
  end
end
