class ImageUploader < ApplicationUploader
  version :thumb do
    process resize_to_limit: [250, 200]
  end
end
