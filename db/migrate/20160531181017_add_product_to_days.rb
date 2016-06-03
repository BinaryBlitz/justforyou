class AddProductToDays < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :day, foreign_key: true
  end
end
