class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.string :status, null: false
      t.datetime :delivered_at, null: false
      t.belongs_to :order, foreign_key: true
      t.timestamps
    end
  end
end
