class AddBonusesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bonuses, :integer, default: 0
  end
end
