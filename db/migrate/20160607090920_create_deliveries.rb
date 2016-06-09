class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.integer :status, default: 0
      t.datetime :scheduled_for, null: false
      t.belongs_to :order, foreign_key: true
      t.timestamps
    end
  end
end
