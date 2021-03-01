require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'item_name, image, item_description, item_category_id, item_condition_id, shipping_fee_id, shipping_place_id, shipping_days_id, item_price が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_nameが40文字を超えたら出品できない' do
        random_name = Faker::Lorem.characters(number: 50)
        @item.item_name = random_name
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_descriptionが空では出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'item_descriptionが1000字を超えたら出品できない' do
        random_text = Faker::Lorem.characters(number: 1100)
        @item.item_description = random_text
        @item.valid?
        expect(@item.errors.full_messages).to include('Item description is too long (maximum is 1000 characters)')
      end
      it 'item_category_idが1では出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item category must be other than 1')
      end
      it 'item_condition_idが1では出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition must be other than 1')
      end
      it 'shipping_fee_idが1では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee must be other than 1')
      end
      it 'shipping_place_idが1では出品できない' do
        @item.shipping_place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping place must be other than 1')
      end
      it 'shipping_days_idが1では出品できない' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping days must be other than 1')
      end
      it 'item_priceが空では出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが半角数字以外では出品できない' do
        @item.item_price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not included in the list')
      end
      it 'item_priceが300より小さいと出品できない' do
        @item.item_price = 150
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not included in the list')
      end
      it 'item_priceが9,999,999より大きいと出品できない' do
        @item.item_price = 999_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not included in the list')
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
