require 'rails_helper'


RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '出品できないとき' do
    it "画像が空だと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "価格に半角数字以外が含まれている場合は出品できない（※半角数字以外が一文字でも含まれていれば良い）" do
      @item.money = "1１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Money is out of setting range")
    end
    it "価格が300円未満では出品できない" do
      @item.money = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Money must be greater than 300")
    end
    it "価格が9_999_999円を超えると出品できない" do
      @item.money = '1_000_000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Money must be an integer")
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
    it "カテゴリーに「---」が選択されている場合は出品できない" do
      @item.category_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態が空だと出品できない" do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "商品の状態に「---」が選択されている場合は出品できない" do
      @item.status_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "配送料が空だと出品できない" do
      @item.shipping_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end
    it "配送料の負担に「---」が選択されている場合は出品できない" do
      @item.shipping_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end
    it "配送地域が空だと出品できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "発送までの日数に「---」が選択されている場合は出品できない" do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank")
    end
    it "配送の日にち指定が空だと出品できない" do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank")
    end
    it "userが紐付いていなければ出品できない" do
      
    end
    context '出品できるとき' do
    it 'すべての入力値が正しく入力されていれば登録できる' do
      expect(@item).to be_valid
    end
   end
  end
end 