require 'rails_helper'

describe Item do

  describe '#create' do

    context "can save" do

      it "can be saved" do
        item = build(:item)
        expect(item).to be_valid
      end

      it "can save with size_id" do
        item = build(:item, size_id: 1)
        expect(item).to be_valid
      end

      it "can save with category_id" do
        item = build(:item, category_id: 1)
        expect(item).to be_valid
      end

      it "can save with brand_id" do
        item = build(:item, brand_id: 1)
        expect(item).to be_valid
      end

    end


    context "can not save" do

      it "is invalid without a name" do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it "is invalid with a name that has more than 40 characters" do
        item = build(:item, name:"AAAAAAAAAABBBBBBBBBBCCCCCCCCCCDDDDDDDDDDDD")
        item.valid?
        expect(item.errors[:name][0]).to include("is too long")
      end

      it "is invalid without details" do
        item = build(:item, details: nil)
        item.valid?
        expect(item.errors[:details]).to include("can't be blank")
      end

      it "is invalid without price" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end


      it "is invalid without condition" do
        item = build(:item, condition: nil)
        item.valid?
        expect(item.errors[:condition]).to include("can't be blank")
      end

      it "is invalid without delivery_fee" do
        item = build(:item, delivery_fee: nil)
        item.valid?
        expect(item.errors[:delivery_fee]).to include("can't be blank")
      end

      it "is invalid without delivery_term" do
        item = build(:item, delivery_term: nil)
        item.valid?
        expect(item.errors[:delivery_term]).to include("can't be blank")
      end

      it "is invalid without delivery_method" do
        item = build(:item, delivery_method: nil)
        item.valid?
        expect(item.errors[:delivery_method]).to include("can't be blank")
      end

      it "is invalid without delivery_location" do
        item = build(:item, delivery_location: nil)
        item.valid?
        expect(item.errors[:delivery_location]).to include("can't be blank")
      end

      it "is invalid without category_id" do
        item = build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id]).to include("can't be blank")
      end


      it "is invalid without user_id" do
        item = build(:item, user_id: nil)
        item.valid?
        expect(item.errors[:user_id]).to include("can't be blank")
      end

      it "is invalid without size_id" do
        item = build(:item, size_id: nil)
        item.valid?
        expect(item.errors[:size_id]).to include("can't be blank")
      end


      it "is invalid without brand_id" do
        item = build(:item, brand_id: nil)
        item.valid?
        expect(item.errors[:brand_id]).to include("can't be blank")
      end
    end
  end
end

