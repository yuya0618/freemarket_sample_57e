class RemoveTextToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column    :users, :text,            :text,    null: false
    add_column    :users, :text,            :text
  end
end
