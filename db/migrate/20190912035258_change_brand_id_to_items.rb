class ChangeBrandIdToItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :brands
  end
end
