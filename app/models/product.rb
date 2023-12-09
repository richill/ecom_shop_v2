class Product < ApplicationRecord
  is_impressionable

  belongs_to :user
end
