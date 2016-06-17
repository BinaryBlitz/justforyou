class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :number_of_days, null: false
      t.belongs_to :order, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
