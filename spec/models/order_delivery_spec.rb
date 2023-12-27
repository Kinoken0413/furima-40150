require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品の購入' do
    before do
      item = FactoryBot.create(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: item.user_id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_delivery).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'ユーザーidが空では購入できない' do
        @order_delivery.user_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it '商品idが空では購入できない' do
        @order_delivery.item_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'トークンが空では購入できない' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @order_delivery.postal_code = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は半角数字以外だと購入できない' do
        @order_delivery.postal_code = '１２３－４５６７'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が空では購入できない' do
        @order_delivery.prefecture_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @order_delivery.prefecture_id = '1'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では購入できない' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁未満では購入できない' do
        @order_delivery.phone_number = '123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is too short')
      end
      it '電話番号が12桁以上では購入できない' do
        @order_delivery.phone_number = '123456789012'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Phone number is too long')
      end
      it '電話番号が半角数字以外では購入できない' do
        @order_delivery.phone_number = '０７０１１１１２２２２'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end
