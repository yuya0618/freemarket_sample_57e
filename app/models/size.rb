<<<<<<< Updated upstream
class Size < ApplicationRecord
  has_many :items
  has_many :categories_sizes
  has_many :categories, through: :categories_sizes
=======
class Size < ActiveHash::Base
  include ActiveHash::Associations
  

  # has_many :items
  # has_many :categories_sizes
  # has_many :categories, through: :categories_sizes
>>>>>>> Stashed changes

end
