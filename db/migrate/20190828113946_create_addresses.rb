class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer       :zip_code, null: false
      t.integer       :address_pref, null: false
      t.string       :address_city, null: false
      t.string       :address_number, null: false
      t.string       :building
      t.references    :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
