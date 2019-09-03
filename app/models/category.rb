class Category < ApplicationRecord
  has_many :items
  has_many :categories_sizes
  has_many :sizes, through: :categories_sizes
  has_ancestry
end

