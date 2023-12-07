class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorited, polymorphic: true

  scope :favorite_products, -> {where(favorited_type: 'Product')}
end
