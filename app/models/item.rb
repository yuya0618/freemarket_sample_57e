class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :size
  has_many :images, dependent: :destroy
  has_one :order
end
