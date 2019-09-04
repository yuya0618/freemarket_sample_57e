class DropProfile < ActiveRecord::Migration[5.2]
  def change
    drop_table :profiles
  end
end
