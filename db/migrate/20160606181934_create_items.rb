class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :content, null: false
      t.integer :weight, null: false
      t.float :calories, null: false
      t.time :starts_at, null: false
      t.time :ends_at, null: false
      t.belongs_to :day, foreign_key: true
      t.timestamps
    end
  end
end
