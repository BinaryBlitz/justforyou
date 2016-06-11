class RemoveDayFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :products, :day, foreign_key: true
  end
end
