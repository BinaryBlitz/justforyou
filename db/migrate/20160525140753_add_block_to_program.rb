class AddBlockToProgram < ActiveRecord::Migration[5.0]
  def change
    add_reference :programs, :block, foreign_key: true
  end
end
