require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe "ユーザー新規登録" do
    context '新規登録できないとき'
    it "重複したメールアドレスは登録できない" do
    @user = create(:user) 
    another_user = build(:user, email: user.email)
    another_user.valid? 
    expect(another_user.errors[:emali]).to incluse("はすでに存在しています") 

    end
    it "メールアドレスに＠を含まない場合は登録できない" do
      @user =
    end
    it "パスワードが６文字未満では登録できない" do
      @user =
    end
    it "英字のみのパスワードでは登録できない" do
      @user
    end
    it "全角文字を含むパスワードでは登録できない" do
      @user =
    end
    it "パスワードとパスワード（確認用）が不一致だと登録できない" do
      @user =
    end
    it "姓（全角）が空だと登録できない" do 
      @user =
    end
    it "姓（全角）に半角文字が含まれていると登録できない" do
      @user =
    end
    it "名（全角）が空だと登録できない" do
      @user =
    end
    it "名（全角）に半角文字が含まれていると登録できない" do
      @user =
    end
    it "姓（カナ）が空だと登録できない" do
      @uaer =
    end
    it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user =
    end
    it "名（カナ）が空だと登録できない" do
      @user =
    end
    it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user =
    end
    it "生年月日が空だと登録できない" do
      @user
    end
  end
    context '新規登録できるとき' do
    it 'すべての入力値が正しく入力されていれば登録できる' do
    end
   end
  end



  #全部のテストコードが@userに対して代入するものがFactry Botだった場合はこちらを持って代入することが日強yだと斧割れる可能性があるとも割れるかあ脳性がある。