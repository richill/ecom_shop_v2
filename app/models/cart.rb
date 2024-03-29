class Cart < ApplicationRecord
  has_secure_token
  has_many :cart_items, dependent: :destroy

  enum status: {
    checkout_pending: 0,  #items in a cart or unsuccessful checkout process
    payment_pending: 1,   #successful checkout process & user directed to the thank you page
    payment_complete: 2,  #notification from stripe confirming successful payment
    fulfilled: 3,
    cancelled: 4,
  }

  def quantity
    cart_items.sum(&:quantity)
  end
end
