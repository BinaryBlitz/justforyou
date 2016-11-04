class AddUnitToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :unit, :string, null: false
  end
end
