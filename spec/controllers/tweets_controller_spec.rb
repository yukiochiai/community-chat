require 'rails_helper'

describe TweetsController do
  let(:user) { create(:user) }
  describe 'GET #new' do
    context 'ログインしている場合' do
      before do
        login user
        get :new, params:{ user_id: user.id }
      end

      it '@tweetに期待した値が入っていること' do
        expect(assigns(:tweet)).to be_a_new(Tweet)
      end

      it "new.html.erbに遷移すること" do
        get :new
        expect(response).to render_template :new
      end

    end
    context 'ログインしていない場合' do
      before do 
        get :new, params:{ user_id: user.id }
      end

      it 'ログイン画面にリダイレクトすること' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end