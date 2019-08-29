class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text          :text
      t.string        :firstname, null: false
      t.string        :lastname, null: false
      t.string        :firstname_kana, null: false
      t.string        :lastname_kana, null: false
      t.integer       :birth_year, null: false
      t.integer       :birth_month, null: false
      t.integer       :birth_day, null: false
      t.integer       :phone_number
      t.references    :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
