class Order < ApplicationRecord
  belongs_to :admin
  has_many :order_products

  def self.order_asc
    order(created_at: :asc)
  end

  def self.order_desc
    order(created_at: :desc)
  end

  def self.unfulfilled_orders
    where(fulfilled: false)
  end

  def self.fulfilled_orders
    where(fulfilled: true)
  end

  def total_order_value
    ordered_products = order_products.map { |o| o.product }
    total_price = ordered_products.map(&:price).sum.to_i
    total_price*100
  end
end
