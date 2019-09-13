class ChangeCategoryIdToItems2 < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :items, :categories
  end
end
