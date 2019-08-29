class AddNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column    :items, :name,            :string,  null: false, default: false
    add_column    :items, :price,           :integer, null: false, default: false
    add_column    :items, :details,         :string,  null: false, default: false
    add_column    :items, :condition,       :integer, null: false, default: false
    add_column    :items, :delivery_fee,    :integer, null: false, default: false
    add_column    :items, :delivery_method, :integer, null: false, default: false
    add_column    :items, :delivery_location,        :integer, null: false, default: false
    add_column    :items, :delivery_term,            :integer, null: false, default: false
    add_reference :items, :user,            foreign_key: true, null: false, default: false
  end
end
