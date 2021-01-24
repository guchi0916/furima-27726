require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    describe '#create' do
      before do
        @user = FactoryBot.build(:user)
      end

      context "user is registered" do
        it "is valid with a nickname, email, last_name, first_name, last_name_kana, birthday, first_name_kana, password, password_confirmation" do
          expect(@user).to be_valid
        end

        it "is valid with a password that has more than 6 characters " do
          @user.password = "0000aaa"
          @user.password_confirmation = "0000aaa"
          expect(@user).to be_valid
        end


      end


      context "user is not registered" do
        it "is invalid without a nickname" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors[:nickname]).to include("can't be blank")
        end
      
        it "is invalid without an email" do
          @user.email = nil
          @user.valid?
          expect(@user.errors[:email]).to include("can't be blank")
        end

        it "is invalid without a last_name" do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors[:last_name]).to include("can't be blank")
        end

        it "is invalid without a first_name" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors[:first_name]).to include("can't be blank")
        end

        it "is invalid without a last_name_kana" do
          @user.last_name_kana = nil
          @user.valid?
          expect(@user.errors[:last_name_kana]).to include("can't be blank")
        end

        it "is invalid without a first_name_kana" do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors[:first_name_kana]).to include("can't be blank")
        end

        it "is invalid without a birthday" do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors[:birthday]).to include("can't be blank")
        end

        it "is invalid without a password" do
          @user.password = nil
          @user.valid?
          expect(@user.errors[:password]).to include("can't be blank")
        end

        it "is invalid without a password_confirmation" do
          @user.password_confirmation = "bbbb2222"
          @user.valid?
          expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
        end

        it "is invalid with a password that has less than 5 characters " do
          @user.password = "00000"
          @user.password_confirmation = "00000"
          @user.valid?
          expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
        end

        it "is invalid with a duplicate email address" do
          user = create(:user)
          another_user = build(:user, email: user.email)
          another_user.valid?
          expect(another_user.errors[:email]).to include("has already been taken")
        end

        it "is invalid with a password is only number" do
          @user.password = "11111111"
          @user.password_confirmation = "11111111"
          @user.valid?
          expect(@user.errors[:password]).to include("is invalid")
        end
    
        it "is invalid with a password is only alphabetic" do
          @user.password = "aaaaaaaa"
          @user.password_confirmation = "aaaaaaaa"
          @user.valid?
          expect(@user.errors[:password]).to include("is invalid")
        end

        it 'is invalid with last_name_kana is not kana' do
          @user.last_name_kana = "たなか" 
          @user.valid?
          expect(@user.errors[:last_name_kana]).to include("is invalid")
        end

        it 'is invalid with first_name_kana is not kana' do
          @user.first_name_kana = "いちろう" 
          @user.valid?
          expect(@user.errors[:first_name_kana]).to include("is invalid")
        end

        it 'is invalid with last_name is not Full-width' do
          @user.last_name = "tanaka" 
          @user.valid?
          expect(@user.errors[:last_name]).to include("is invalid")
        end

        it 'is invalid with first_name_kana is Full-width' do
          @user.first_name = "ichiro" 
          @user.valid?
          expect(@user.errors[:first_name]).to include("is invalid")
        end
      
      end
    end
  end

end