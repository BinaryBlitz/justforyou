class AddIndividualPriceToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :individual_price, :boolean, default: false
  end
end
