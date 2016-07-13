class AddColorToBlocks < ActiveRecord::Migration[5.0]
  def change
    add_column :blocks, :color, :string
  end
end
