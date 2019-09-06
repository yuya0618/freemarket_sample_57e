class ChangeSizeIdToItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :sizes
  end
end
