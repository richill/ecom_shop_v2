class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :category_productitemtypes, dependent: :destroy
  has_many :category_productstyles, dependent: :destroy
  has_many :category_productsubtypes, dependent: :destroy
  has_many :category_producttypes, dependent: :destroy
end
