class ChangeSizeIdToCategoriesSizes < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :categories_sizes, :sizes
  end
end
