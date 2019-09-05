class ChangeColumnToImage < ActiveRecord::Migration[5.2]
  def up
    change_column :images, :image, :string
  end

  def down
    change_column :images, :images, :json
  end
end
