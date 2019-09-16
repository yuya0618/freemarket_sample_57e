require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(FactoryBot.build(:address, user: @user)).to be_valid
  end

  it "is invalid without a zip code" do
    address = FactoryBot.build(:address, user: @user, zip_code: nil)
    address.valid?
    expect(address.errors[:zip_code]).to include("を入力してください")
  end

  it "is invalid with a zip code in a wrong format" do
    address = FactoryBot.build(:address, user: @user, zip_code: "1234567")
    address.valid?
    expect(address.errors[:zip_code]).to include("のフォーマットが不適切です")
  end

  it "is invalid without a prefecture id" do
    address = FactoryBot.build(:address, user: @user, prefecture_id: nil)
    address.valid?
    expect(address.errors[:prefecture_id]).to include("を入力してください")
  end

  it "is invalid without a address" do
    address = FactoryBot.build(:address, user: @user, address_city: nil)
    address.valid?
    expect(address.errors[:address_city]).to include("を入力してください")
  end

  it "is invalid without an address" do
    address = FactoryBot.build(:address, user: @user, address_number: nil)
    address.valid?
    expect(address.errors[:address_number]).to include("を入力してください")
  end
end