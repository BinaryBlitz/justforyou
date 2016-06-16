class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.belongs_to :order
      t.integer :amount, null: false
      t.boolean :paid, default: false
      t.belongs_to :payment_card
      t.integer :transaction_id

      t.timestamps
    end
  end
end
