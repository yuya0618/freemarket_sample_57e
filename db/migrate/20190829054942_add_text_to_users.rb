class AddTextToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column    :users, :text,            :text,    null: false
    add_column    :users, :firstname,       :string,  null: false
    add_column    :users, :firstname_kana, :string,  null: false
    add_column    :users, :lastname_kana,  :string,  null: false
    add_column    :users, :birth_year,     :integer, null: false
    add_column    :users, :birth_month,    :integer, null: false
    add_column    :users, :birth_day,      :integer, null:false
    add_column    :users, :phone_number,   :integer, null:false
  end
end
