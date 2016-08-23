class ChangeHouseTypeInAddresses < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :house, :string
  end
end
