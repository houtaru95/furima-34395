require 'rails_helper'
RSpec.describe OrderDestination, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_destination).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_destination.postal_code = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_destination.postal_code = '1234567'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Postal code Input correctly')
    end
    it 'shipping_place_idを選択していないと保存できないこと' do
      @order_destination.shipping_place_id = 1 
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Shipping place Select")
    end
    it 'cityが空だと保存できないこと' do
      @order_destination.city = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @order_destination.address = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Address can't be blank")
    end
    it 'tell_numberが空だと保存できないこと' do
      @order_destination.tell_number = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Tell number can't be blank")
    end
    it 'tell_numberが半角数字以外だと保存できないこと' do
      @order_destination.tell_number = 'aaaaaaaaaa'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Tell number Input correctly")
    end
    it 'tell_numberが11桁よりより大きいと保存できないこと' do
      @order_destination.tell_number = '090123456789'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Tell number Input correctly")
    end
    it 'tokenが空だと保存できないこと' do
      @order_destination.token = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Token can't be blank")
    end
  end
end