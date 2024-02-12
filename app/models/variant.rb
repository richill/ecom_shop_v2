class Variant < ApplicationRecord
  belongs_to :product

  mount_uploader :image_var, ImagevariantUploader
end
