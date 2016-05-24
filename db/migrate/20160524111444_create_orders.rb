class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :address, null: false
      t.string :phone_number, null: false
      t.text :comment

      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
