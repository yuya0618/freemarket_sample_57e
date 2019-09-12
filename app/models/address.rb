class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  
  # バリデーション
  # validates :zip_code, {presence:true} /\A\d{3}[-]\d{4}\z/ #数字のみでハイフンが入っていること
  # validates :address_city, presence:true
  # validates :address_number, presence:true
end
