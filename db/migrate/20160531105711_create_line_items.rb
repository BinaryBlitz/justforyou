class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :program, foreign_key: true
      t.integer :number_of_days, null: false

      t.timestamps
    end
  end
end
