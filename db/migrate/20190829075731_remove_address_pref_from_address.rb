class RemoveAddressPrefFromAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :address_pref, :integer
  end
end
