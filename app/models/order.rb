class Order < ApplicationRecord
  belongs_to :admin

  def self.order_desc
    order(created_at: :desc)
  end
end
