require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do

  describe '#create' do
    before do

      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @purchaser_address = FactoryBot.build(:purchaser_address, item_id: item.id, user_id: user.id)
      sleep(1)
      # "記述方法はハッシュと同じ考え方。 "User.new(email: "aaa@bbb.com")item_id: ~~~, user_id: ~~~

    end

    context '購入がうまくいくとき' do

      it '全てのデータが存在すれば登録できること' do
        expect(@purchaser_address).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do

      it '郵便番号にハイフンが入力されないと登録できないこと' do
        @purchaser_address.postal_code = '0100013'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it '郵便番号が空の状態では登録できないこと' do
        @purchaser_address.postal_code = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '電話番号が短く入力すると登録できないこと' do
        @purchaser_address.phone_number = '12345'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Phone number is too short")
      end

      it '電話番号が空の状態では登録できないこと' do
        @purchaser_address.phone_number = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '都道府県が---では登録できないこと' do
        @purchaser_address.prefecture_id = 1
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村名が空の状態では登録できないこと' do
        @purchaser_address.city = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空の状態では登録できないこと' do
        @purchaser_address.block = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Block can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @purchaser_address.token = nil
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
