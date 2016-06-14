class AddDayPositionToDelivery < ActiveRecord::Migration[5.0]
  def change
    add_column :deliveries, :day_position, :integer
  end
end
