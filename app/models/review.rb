class Review < ApplicationRecord
  validates :user_id, uniqueness: { scope: [:product_id]}
  # This validation will make sure the combination user_id and product_id will be unique in your reviews table.
  # user can only review a product once

  belongs_to :user
  belongs_to :product

  LOVE = %i[ one two three four five ]

  def self.reviewer_exist?(user, product)
    exists?(user_id: user, product_id: product)
  end
  # this methods checks if the user has already reviewed the product
end
