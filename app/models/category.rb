class Category < ApplicationRecord
  has_many :items
  has_many :categories_sizes
  has_many :sizes, through: :categories_sizes
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'
end

