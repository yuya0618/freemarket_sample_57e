class RemoveSecurityCodeIdToCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column    :credit_cards, :security_code, :integer, null:false
  end
end
