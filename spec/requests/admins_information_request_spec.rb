# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Information controller', type: :request do
  describe '管理者お知らせ機能' do
    let(:admin)       { create(:admin)       }
    let(:information) { create(:information) }

    before do
      visit new_admin_session_path
      fill_in 'admin[username]', with: admin.username
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'

      visit new_admins_information_path
      fill_in 'information[title]', with: information.title
      fill_in 'information[body]', with: information.body
      click_button '保存'
    end

    describe 'お知らせ一覧' do
      context '表示の確認' do
        it 'お知らせ一覧と表示されている' do
          visit admins_informations_path
          expect(page).to have_content 'お知らせ一覧'
        end
        it 'タイトルが表示されている' do
          visit admins_informations_path
          expect(page).to have_content information.title
        end
        it '編集リンクが表示されている' do
          visit admins_informations_path
          expect(page).to have_link '編集'
        end
        it '削除リンクが表示されている' do
          visit admins_informations_path
          expect(page).to have_link '削除'
        end
        it 'お知らせ追加のリンクが表示されている' do
          visit admins_informations_path
          expect(page).to have_link 'お知らせ追加'
        end
        it 'カテゴリー追加のリンクが表示されている' do
          visit admins_informations_path
          expect(page).to have_link 'カテゴリー追加'
        end
      end
    end

    describe 'お知らせの追加' do
      context '表示の確認' do
        it 'お知らせ作成と表示されている' do
          visit new_admins_information_path
          expect(page).to have_content 'お知らせ作成'
        end
        it 'タイトルフォームが表示されている' do
          visit new_admins_information_path
          expect(page).to have_field 'information[title]'
        end
        it '内容フォームが表示されている' do
          visit new_admins_information_path
          expect(page).to have_field 'information[body]'
        end
      end

      context '新規追加' do
        it 'お知らせの追加に成功する' do
          visit new_admins_information_path
          fill_in 'information[title]', with: information.title
          fill_in 'information[body]', with: information.body
          click_button '保存'

          expect(page).to have_content '新規登録しました'
        end
        it 'お知らせの追加に失敗する' do
          visit new_admins_information_path
          fill_in 'information[title]', with: ''
          fill_in 'information[body]', with: ''
          click_button '保存'

          expect(page).to have_content '新規登録できませんでした'
        end
      end
    end

    describe 'お知らせの編集' do
      context '表示の確認' do
        it '内容の変更と表示されている' do
          visit edit_admins_information_path(information)
          expect(page).to have_content '内容の変更'
        end
        it 'タイトル編集フォームが表示されている' do
          visit edit_admins_information_path(information)
          expect(page).to have_field 'information[title]', with: information.title
        end
        it '内容編集フォームが表示されている' do
          visit edit_admins_information_path(information)
          expect(page).to have_field 'information[body]', with: information.body
        end
      end

      context 'お知らせ編集' do
        it 'お知らせの追加に成功する' do
          visit edit_admins_information_path(information)
          fill_in 'information[title]', with: information.title
          fill_in 'information[body]', with: information.body
          click_button '保存'

          expect(page).to have_content '内容を更新しました'
        end
        it 'お知らせの追加に失敗する' do
          visit edit_admins_information_path(information)
          fill_in 'information[title]', with: ''
          fill_in 'information[body]', with: ''
          click_button '保存'

          expect(page).to have_content '内容を更新できませんでした'
        end
      end
    end
  end
end
