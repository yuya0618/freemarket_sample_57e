class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :credit_card, dependent: :destroy
  accepts_nested_attributes_for :credit_card

  has_one :address
  accepts_nested_attributes_for :address
  
  has_many :items
end
