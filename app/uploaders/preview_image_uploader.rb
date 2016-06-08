class PreviewImageUploader < ApplicationUploader
  process resize_to_limit: [150, 100]
end
