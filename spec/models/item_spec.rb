require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '新規登録できないとき' do
    it "画像が空だと出品できない" do
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "名前が空だと出品できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が空だと出品できない" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "価格が設定されていない" do
      @item.money = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Money can't be blank")
    end
    it "カテゴリーが空だと出品できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態が空だと出品できない" do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "配送料が空だと出品できない" do
      @item.shipping_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
    end
    it "配送地域が空だと出品できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "配送の日にち指定が空だと出品できない" do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank")
    end
    context '新規登録できるとき' do
    it 'すべての入力値が正しく入力されていれば登録できる' do
      #expect(@item).to be_valid
    end
   end
  end
end 