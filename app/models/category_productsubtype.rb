class CategoryProductsubtype < ApplicationRecord
  has_many :products
  has_many :category_productstyles, dependent: :destroy
  belongs_to :category_productitemtype
  belongs_to :admin
end
