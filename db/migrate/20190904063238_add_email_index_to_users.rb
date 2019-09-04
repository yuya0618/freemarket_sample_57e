class AddEmailIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :encrypted_password, unique: true
    add_index :users, :email, unique: true
  end
end
