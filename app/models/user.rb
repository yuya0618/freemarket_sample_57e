class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2],:authentication_keys => [:user_id]
  #  googleとfacebookのsns認証
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id)
      else
        user = User.new(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          phone_number: "00000000000"
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id)
      end
    end
    return user
  end

  
  # アソシエーション
  has_many :credit_cards, dependent: :destroy
  accepts_nested_attributes_for :credit_cards
  has_many :sns_credentials
  has_one :address
  accepts_nested_attributes_for :address
  has_many :items

  # バリデーション
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true
  validates :nickname, presence:true
  validates :firstname, presence:true
  validates :lastname, {presence:true}
  validates :firstname_kana, presence: true
  validates :lastname_kana, presence: true
  validates :birth_year, presence:true
  validates :birth_month, presence:true
  validates :birth_day, presence:true
  validates :password, presence: true, length: { minimum: 6 }  #7文字以上
  validates :password_confirmation, presence: true, length: { minimum: 6 } #7文字以上
  validates :phone_number, presence: true
end
