class ChangeDataDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :details, nil
    change_column :items, :details, :text 
  end
end
