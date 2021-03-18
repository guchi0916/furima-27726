require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    context '購入可能' do

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end

      it 'build_nameは空でも保存できること' do
        @purchase_address.build_name = ''
        expect(@purchase_address).to be_valid
      end

    end

    context '購入不可能' do

      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeはハイフンなしだと保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが数字以外だと保存できないこと' do
        @purchase_address.postal_code = 'あああ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idが選択していないと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'Addressが空だと保存できないこと' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'Phone numberが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'Phone numberが数字以外だと保存できないこと' do
        @purchase_address.phone_number = 'あゝあゝ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'Phone numberが12桁以上だと保存できないこと' do
        @purchase_address.phone_number = "090123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'Phone numberが英数混合だと保存できないこと' do
        @purchase_address.phone_number = "0901234abcd"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
 
      it "user_idが空では登録できないこと" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できないこと" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end



    end
     
  end
end
