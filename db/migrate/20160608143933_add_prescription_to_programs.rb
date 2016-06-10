class AddPrescriptionToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :prescription, :text, array: true, default: []
  end
end
