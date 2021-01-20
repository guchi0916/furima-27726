require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    describe '#create' do
      before do
        @user = FactoryBot.build(:user)
      end

        it "is valid with a nickname, email, last_name, first_name, last_name_kana, birthday, first_name_kana, password, password_confirmation" do
          expect(@user).to be_valid
        end

        it "is invalid without a nickname" do
          @user.nickname = nill
          user.valid?
          expect(user.errors[:nickname]).to include("can't be blank")
        end
      
        it "is invalid without an email" do
          @user.email = nill
          user.valid?
          expect(user.errors[:email]).to include("can't be blank")
        end

        it "is invalid without a last_name" do
          @user.last_name = nill
          user.valid?
          expect(user.errors[:last_name]).to include("can't be blank")
        end

        it "is invalid without a first_name" do
          @user.first_name = nill
          user.valid?
          expect(user.errors[:first_name]).to include("can't be blank")
        end

        it "is invalid without a last_name_kana" do
          @user.last_name_kana = nill
          user.valid?
          expect(user.errors[:last_name_kana]).to include("can't be blank")
        end

        it "is invalid without a first_name_kana" do
          @user.first_name_kana = nill
          user.valid?
          expect(user.errors[:first_name_kana]).to include("can't be blank")
        end

        it "is invalid without a birthday" do
          @user.birthday = nill
          user.valid?
          expect(user.errors[:birthday]).to include("can't be blank")
        end

        it "is invalid without a password" do
          @user.password = nill
          user.valid?
          expect(user.errors[:password]).to include("can't be blank")
        end

        it "is invalid without a password_confirmation" do
          @user.assword_confirmation = ""
          user.valid?
          expect(user.errors[:password_confirmation]).to include("doesn't match Password")
        end

        it "is valid with a password that has more than 6 characters " do
          @user.password = "000000"
          @user.password_confirmation = "000000"
          expect(user).to be_valid
        end

        it "is invalid with a password that has less than 5 characters " do
          @user.password = "00000"
          @user.password_confirmation = "00000"
          user.valid?
          expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
        end

        it "is invalid with a duplicate email address" do
          user = create(:user)
          another_user = build(:user, email: user.email)
          another_user.valid?
          expect(another_user.errors[:email]).to include("has already been taken")
        end

        it "email is unique" do
          expect(user).to_not be_valid
          expect(user.errors[:email]).to include("has already been taken")
        end

        it "is invalid with an email that doesn't include @" do
          user = build(:user)
          user.valid?
          expect(user.errors[:email]).to include("can't be blank")
        end

    end
  end

end