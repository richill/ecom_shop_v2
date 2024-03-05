class Product < ApplicationRecord
  # is_impressionable :counter_cache => true
  is_impressionable :counter_cache => true, :column_name => :impressions_count, :unique => true

  belongs_to :admin
  belongs_to :category_productitemtype
  belongs_to :category_productstyle
  belongs_to :category_productsubtype
  belongs_to :category_producttype
  has_many :reviews
  has_many :variants
  has_many :order_products

  def average_rating
    if self.reviews.present?
      review_score = reviews.map(&:rating).sum.to_i   #17 [5, 5, 3, 4]
      review_count = reviews.count                    #4 reviews
      (review_score/review_count).to_i                #4.25 (17/4)
    end
  end

  def stock_count
    variants.map(&:stock).sum.to_i
  end

  def self.order_desc
    order(created_at: :desc)
  end

end
