class CreateExchanges < ActiveRecord::Migration[5.0]
  def change
    create_table :exchanges do |t|
      t.references :user, foreign_key: true
      t.references :purchase, foreign_key: true
      t.references :program
      t.boolean :paid, default: false
      t.integer :pending_balance, default: 0

      t.timestamps
    end
  end
end
