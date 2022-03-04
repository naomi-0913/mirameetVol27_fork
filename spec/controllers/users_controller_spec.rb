require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#showアクションテスト' do
    context 'ユーザが存在する場合' do
      let(:user) { create(:user, nickname: 'Toshio') }
      let(:post_instance) { create(:post, user: user, text: 'PostTest', image: 'https://example_image_url') }

      context 'ログインしている場合' do
        before do
          sign_in user
          post_instance
        end

        it '200レスポンスを返すこと' do
          get :show, params: { id: user.id }
          expect(response.status).to eq 200
        end

        it '正常にレスポンスを返すこと' do
          get :show, params: { id: user.id }
          expect(response).to be_successful
        end
      end

      # context 'ログインしていない場合' do
      #   before do
      #     sign_out user
      #   end

      #   it 'リクエストが成功しないこと' do
      #     get user_path user.id
      #     expect(response.status).to eq 302
      #   end        
      # end
    end
  end
end