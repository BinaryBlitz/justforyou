class CreatePaymentCards < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_cards do |t|
      t.integer :number, null: false, limit: 8
      t.string  :name, null: false
      t.integer :month, null: false
      t.integer :year, null: false
      t.integer :cvc, null: false

      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
