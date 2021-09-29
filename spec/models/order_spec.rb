require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  context '新規購入できるとき' do
    it 'すべての情報があれば登録できる' do
      expect(@order).to be_valid
    end
    it "建物名は空でも保存できること" do
      @order.building_name = ''
    end
  end

  context '内容に問題がある場合' do
    it "郵便番号が空だと購入できない" do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it "郵便番号が半角のハイフンを含んだ正しい形式でないと保存できない" do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it "都道府県が空だと購入できない" do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市町村区が空だと購入できない" do
      @order.municipalities = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipalities can't be blank")
    end
    it "番地が空だと購入できない" do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号が数字以外だと購入できない" do
      @order.telephone_number = '03-1234-5678'
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number is invalid. Input only number")
    end
    it "電話番号が11文字以上だと購入できない" do
      @order.telephone_number = '000-1234-56789'
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number is too long")
    end
    it "電話番号が10文字以下だと購入できない" do
      @order.telephone_number = '000-1234'
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number is too short")
    end
    it "tokenが空では登録できないこと" do    
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
   end
  end
 end

 