class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :favorited, source_type: 'Product'

  has_many :reviews
end
