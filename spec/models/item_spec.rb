require 'rails_helper'

RSpec.describe Item, type: :model do

  describe Item do
    describe '#create' do
      before do
        @item = FactoryBot.build(:item)
        @item.image = fixture_file_upload('public/images/sample1.png')
      end

      context "item is registered" do
        it "is valid with a name, price, item_detail" do
          expect(@item).to be_valid
        end
      end

      context "item is not registered" do

        it 'is invalid without a image' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end


        it "is invalid without a name" do
          @item.name = nil
          @item.valid?
          expect(@item.errors[:name]).to include("can't be blank")
        end

        it "is invalid without price" do
          @item.price = nil
          @item.valid?
          expect(@item.errors[:price]).to include("can't be blank")
        end

        it "is invalid if price in not a number" do
          @item.price = "aaa"
          @item.valid?
          expect(@item.errors[:price]).to include("is not a number")
        end

        it "is invalid if price is full-width" do
          @item.price = "ああああ"
          @item.valid?
          expect(@item.errors[:price]).to include("is not a number")
        end

        it "is invalid if price is half-width alphanumeric mixed" do
          @item.price = "11aaa"
          @item.valid?
          expect(@item.errors[:price]).to include("is not a number")
        end

        it "price less than 300 is invalid " do
          @item.price = 200
          @item.valid?
          expect(@item.errors[:price]).to include("must be greater than or equal to 300")
        end

        it "price greater than 9999999 is invalid " do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
        end

        it "is invalid without a item detail" do
          @item.item_detail = nil
          @item.valid?
          expect(@item.errors[:item_detail]).to include("can't be blank")
        end

        it "is invalid if category is 1" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors[:category_id]).to include("must be other than 1")
        end

        it "is invalid if status is 1" do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors[:status_id]).to include("must be other than 1")
        end

        it "is invalid if charge_delivery_fee is 1" do
          @item.charge_delivery_fee_id = 1
          @item.valid?
          expect(@item.errors[:charge_delivery_fee_id]).to include("must be other than 1")
        end

        it "is invalid if prefecture is 1" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors[:prefecture_id]).to include("must be other than 1")
        end

        it "is invalid if day is 1" do
          @item.day_id = 1
          @item.valid?
          expect(@item.errors[:day_id]).to include("must be other than 1")
        end

      end
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
