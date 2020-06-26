# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Tags controller', type: :request do
  describe '管理者タグ機能' do
    let(:admin) { create(:admin) }
    let(:tag)   { create(:tag)   }

    before do
      visit new_admin_session_path
      fill_in 'admin[username]', with: admin.username
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'

      visit admins_tags_path
      fill_in 'tag[name]', with: tag.name
      click_button '追加'
    end

    describe 'タグ一覧' do
      context '表示の確認' do
        it 'タグ一覧と表示されている' do
          visit admins_tags_path
          expect(page).to have_content 'タグ一覧'
        end
        it 'タグ追加フォームが表示されている' do
          visit admins_tags_path
          expect(page).to have_field 'tag[name]'
        end
        it 'タグ名が表示されている' do
          visit admins_tags_path
          expect(page).to have_content tag.name
        end
        it 'タグ名の編集リンクが表示されている' do
          visit admins_tags_path
          expect(page).to have_link 'edit'
        end
        it 'タグ名の削除リンクが表示されている' do
          visit admins_tags_path
          expect(page).to have_link 'destroy'
        end
      end

      context 'タグの追加' do
        it 'タグの追加に成功する' do
          visit admins_tags_path
          fill_in 'tag[name]', with: tag.name
          click_button '追加'

          expect(current_path).to eq('/admins/tags')
        end

        it 'タグの追加に失敗する' do
          visit admins_tags_path
          fill_in 'tag[name]', with: ''
          click_button '追加'

          expect(current_path).to eq('/admins/tags')
        end
      end
    end

    describe 'タグの編集' do
      context '表示の確認' do
        it 'タグ編集と表示されている' do
          visit edit_admins_tag_path(tag)
          expect(page).to have_content 'タグ編集'
        end
        it 'タグ追加フォームが表示されている' do
          visit edit_admins_tag_path(tag)
          expect(page).to have_field 'tag[name]', with: tag.name
        end
      end

      context 'タグの編集' do
        it 'タグの編集に成功する' do
          visit edit_admins_tag_path(tag)
          fill_in 'tag[name]', with: tag.name
          click_button '変更'

          expect(page).to have_content 'タグ名を変更しました'
        end
        it 'タグの編集に失敗する' do
          visit edit_admins_tag_path(tag)
          fill_in 'tag[name]', with: ''
          click_button '変更'

          expect(page).to have_content 'タグ名を変更できませんでした'
        end
      end
    end
  end
end
