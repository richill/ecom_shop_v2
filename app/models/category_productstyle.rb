class CategoryProductstyle < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :category_productsubtype
  belongs_to :admin
end
