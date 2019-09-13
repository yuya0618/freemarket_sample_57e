class ChangeCategoryIdToItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :categories
  end
end
