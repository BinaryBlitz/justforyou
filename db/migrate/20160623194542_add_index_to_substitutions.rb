class AddIndexToSubstitutions < ActiveRecord::Migration[5.0]
  def change
    add_index :substitutions, [:product_id, :user_id], unique: true
  end
end
