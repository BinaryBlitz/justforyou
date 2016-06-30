class AddActiveToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :active, :boolean, default: true
  end
end
