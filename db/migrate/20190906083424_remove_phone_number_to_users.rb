class RemovePhoneNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column   :users, :phone_number,   :integer, null:false
    add_column    :users, :phone_number,   :integer, null:false, limit: 8
  end
end
