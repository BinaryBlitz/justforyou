class AddApartmentAndHouseToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :apartment, :integer
    add_column :addresses, :house, :integer
  end
end
