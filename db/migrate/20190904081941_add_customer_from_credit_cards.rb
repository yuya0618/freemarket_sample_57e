class AddCustomerFromCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :customer, :string, null:false
    add_column :credit_cards, :card, :string, null:false
  end
end
