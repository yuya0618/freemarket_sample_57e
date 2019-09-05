class CategoriesSize < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :size

  
  belongs_to :size
  belongs_to :category
end
