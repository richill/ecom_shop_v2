class Cart < ApplicationRecord
  has_secure_token
  has_many :cart_items, dependent: :destroy
end
