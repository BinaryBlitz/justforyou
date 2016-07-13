class AddIndexToBlocks < ActiveRecord::Migration[5.0]
  def change
    add_index :blocks, :color, unique: true
  end
end
