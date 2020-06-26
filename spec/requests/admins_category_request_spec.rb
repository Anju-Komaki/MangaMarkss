# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Categories controller', type: :request do
  describe '管理者カテゴリー機能' do
    let(:admin)    { create(:admin)    }
    let(:category) { create(:category) }

    before do
      visit new_admin_session_path
      fill_in 'admin[username]', with: admin.username
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'

      visit admins_categories_path
      fill_in 'category[name]', with: 'category'
      click_button '追加'
    end

    describe 'カテゴリー一覧' do
      context '表示の確認' do
        it 'カテゴリー一覧と表示されている' do
          visit admins_categories_path
          expect(page).to have_content 'カテゴリー一覧'
        end
        it 'カテゴリー名フォームが表示されている' do
          visit admins_categories_path
          expect(page).to have_field 'category[name]'
        end
        it 'カテゴリー名が表示されている' do
          visit admins_categories_path
          expect(page).to have_content 'category'
        end
        it 'カテゴリー名の編集リンクが表示されている' do
          visit admins_categories_path
          expect(page).to have_link 'edit'
        end
        it 'カテゴリー名の削除リンクが表示されている' do
          visit admins_categories_path
          expect(page).to have_link 'destroy'
        end
      end

      context 'カテゴリーの追加' do
        it 'カテゴリーの追加に成功する' do
          visit admins_categories_path
          fill_in 'category[name]', with: 'category.name'
          click_button '追加'

          expect(current_path).to eq('/admins/categories')
        end

        it 'カテゴリーの追加に失敗する' do
          visit admins_categories_path
          fill_in 'category[name]', with: ''
          click_button '追加'

          expect(current_path).to eq('/admins/categories')
        end
      end
    end

    describe 'カテゴリーの編集' do
      context '表示の確認' do
        it 'カテゴリー編集と表示されている' do
          visit edit_admins_category_path(category)
          expect(page).to have_content 'カテゴリー編集'
        end
        it 'カテゴリー追加フォームが表示されている' do
          visit edit_admins_category_path(category)
          expect(page).to have_field 'category[name]', with: category.name
        end
      end

      context 'カテゴリー名の編集' do
        it 'カテゴリー名の編集に成功する' do
          visit edit_admins_category_path(category)
          fill_in 'category[name]', with: category.name
          click_button '変更'

          expect(page).to have_content 'カテゴリー名を変更しました'
        end
        it 'カテゴリー名の編集に失敗する' do
          visit edit_admins_category_path(category)
          fill_in 'category[name]', with: ''
          click_button '変更'

          expect(page).to have_content 'カテゴリー名を変更できませんでした'
        end
      end
    end
  end
end
