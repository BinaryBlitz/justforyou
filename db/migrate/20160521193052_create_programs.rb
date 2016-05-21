class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :duration, null: false
      t.integer :first_price, null: false
      t.integer :second_price, null: false
      t.string :preview_img, null: false

      t.timestamps
    end
  end
end
