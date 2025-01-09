# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Auth API', type: :request do
  let(:user) { create(:user, email: 'test@example.com', password: 'password') }

  describe 'POST /api/v1/auth' do
    let(:url) { '/api/v1/auth' }

    context '認証が成功する場合' do
      it 'トークンを返すこと' do
        post url, params: { email: user.email, password: 'password' }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context '認証が失敗する場合' do
      it 'エラーメッセージを返すこと' do
        post url, params: { email: user.email, password: 'wrongpassword' }
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to include('error' => 'Invalid email or password')
      end
    end
  end
end
