class CategoryProductitemtype < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :category_productsubtypes, dependent: :destroy
  belongs_to :admin
end
