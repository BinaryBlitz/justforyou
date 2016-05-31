class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.integer :order_of_days, null: false
      t.belongs_to :program, foreign_key: true
      t.timestamps
    end
  end
end
