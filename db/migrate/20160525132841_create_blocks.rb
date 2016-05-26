class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.string :title, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
