class CategoriesSize < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :size
  belongs_to :category
end
