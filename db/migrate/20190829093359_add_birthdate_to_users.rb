class AddBirthdateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthdate, :date,  null:false
    remove_column    :users, :birth_year,     :integer, null: false
    remove_column    :users, :birth_month,    :integer, null: false
    remove_column    :users, :birth_day,      :integer, null:false
  end
end
