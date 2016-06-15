class PreviewImageUploader < ApplicationUploader
  process resize_to_limit: [250, 200]
end
