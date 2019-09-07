class RemovePhonerToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column    :users, :phone_number,   :integer, null:false, limit: 8
    add_column    :users, :phone_number,   :string, null:false
  end
end
