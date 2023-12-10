class Product < ApplicationRecord
  # is_impressionable :counter_cache => true
  is_impressionable :counter_cache => true, :column_name => :impressions_count, :unique => true

  belongs_to :user
  has_many :reviews
end
