class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  belongs_to :size
  has_many :images
  has_one :order

  enum condition: {mint: 0, near_mint: 1, good: 2, little_stained: 3, stained: 4, poor: 5}
end
