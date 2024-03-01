class CategoryProducttype < ApplicationRecord
  has_many :products
  belongs_to :admin
  # belongs_to :user, optional: true
end
