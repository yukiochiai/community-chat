require 'rails_helper'
describe User do
  describe '#create' do

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = User.new(nickname: nil, email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do 
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "nicknameが7文字以上であれば登録できないこと" do
      user = build(:user, nickname: "aaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は6文字以内で入力してください")
    end

    it "nicknameが6文字以下では登録できること" do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end

    it "重複したemailが存在する場合は登録できないこと" do 
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
  end
end