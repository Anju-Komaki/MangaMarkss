# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comics', type: :request do
  describe '漫画機能' do
    let(:user)        { create(:user)        }
    let(:user_params) { attribute_for(:user) }
    let(:comic)       { create(:comic)       }

    before do
      visit new_user_session_path
      fill_in 'user[username]', with: user.username
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end

    describe 'トレンド画面' do
      context '表示の確認' do
        it 'トレンドと表示される' do
          visit rank_path
          expect(page).to have_content 'トレンド'
        end
        it '全ての作品と表示される' do
          visit rank_path
          expect(page).to have_content '全ての作品'
        end
      end
    end

    describe '全作品画面' do
      context '表示の確認' do
        it 'トレンドと表示される' do
          visit comics_path
          expect(page).to have_content 'トレンド'
        end
        it '全ての作品と表示される' do
          visit comics_path
          expect(page).to have_content '全ての作品'
        end
      end
    end
  end
end
