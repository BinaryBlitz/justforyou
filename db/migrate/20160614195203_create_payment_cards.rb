class CreatePaymentCards < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_cards do |t|
      t.string :number, null: false
      t.string  :holder, null: false
      t.string  :rebill_anchor, null: false

      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end