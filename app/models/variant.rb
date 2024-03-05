class Variant < ApplicationRecord
  mount_uploader :image_var, ImagevariantUploader
  belongs_to :product

  def self.order_desc
    order(created_at: :desc)
  end
end
