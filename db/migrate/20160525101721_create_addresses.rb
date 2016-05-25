class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.text :content, null: false
      t.integer :entrance
      t.integer :floor

      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
