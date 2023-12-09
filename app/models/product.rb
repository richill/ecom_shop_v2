class Product < ApplicationRecord
  is_impressionable :counter_cache => true

  belongs_to :user
end
