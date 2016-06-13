class AddProgramsCountToBlocks < ActiveRecord::Migration[5.0]
  def change
    add_column :blocks, :programs_count, :integer, default: 0
  end
end
