class RemoveCardNumberCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :card_number, :integer
    remove_column :credit_cards, :expiration_month, :integer
  end
end
