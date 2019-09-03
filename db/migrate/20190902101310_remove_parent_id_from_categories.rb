class RemoveParentIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :parent_id, :int
  end
end
