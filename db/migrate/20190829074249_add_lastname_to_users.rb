class AddLastnameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column    :users, :lastname,        :string,  null:false
  end
end
