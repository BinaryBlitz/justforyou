class RemoveProgramIdFromProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :program_id
  end
end
