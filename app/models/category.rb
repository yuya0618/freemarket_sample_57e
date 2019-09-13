class Category < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :items
  has_many :categories_sizes
  has_many :sizes, through: :categories_sizes
  has_many :brands
  has_ancestry
end

