class RenamePreviewImageToImageInPrograms < ActiveRecord::Migration[5.0]
  def change
    rename_column :programs, :preview_image, :image
  end
end
