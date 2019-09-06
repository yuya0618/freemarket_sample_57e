class DropSizes < ActiveRecord::Migration[5.2]
  def change
    drop_table :sizes
  end
end
