class AddCategoryIdToBrands < ActiveRecord::Migration[5.2]
  def change
    add_reference :brands, :category, foreign_key: true, null: false, default: false
  end
end
