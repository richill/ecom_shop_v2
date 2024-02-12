class Variant < ApplicationRecord
  mount_uploader :image_var, ImagevariantUploader
  belongs_to :product
end
