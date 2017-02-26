class AddUnitToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :unit, :string
    change_column_null :programs, :unit, false, 'day'
  end
end
