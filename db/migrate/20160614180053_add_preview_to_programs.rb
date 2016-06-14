class AddPreviewToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :preview, :string
  end
end
