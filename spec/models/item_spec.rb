require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '#create' do
    before do

      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)

    end

    context '新規登録がうまくいくとき' do

      it '全てのデータが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do

      it 'カテゴリーが---では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が---では登録できないこと' do
        @item.product_stats_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product stats must be other than 1")
      end

      it '配送料の負担が---では登録できないこと' do
        @item.delivery_change_burden_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery change burden must be other than 1")
      end

      it '発送元の地域が---では登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数が---では登録できないこと' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
      end

      it '販売価格がないと登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '299円以下では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
    end

      it '10,000,000円以上では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it '全角数字では登録できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it '商品の名前が空では登録できないこと' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明が空では登録できないこと' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it '商品の画像を1枚つけないと登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end