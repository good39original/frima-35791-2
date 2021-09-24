require 'rails_helper'

RSpec.describe Order, type: :model do
  context '新規購入できるとき' do
    it 'すべての入力値が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
    context '購入できないとき' do
      it "住所が空だと購入できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "郵便番号が空だと購入できない" do
      end
      it "郵便番号が空だと購入できない" do
      end

end
