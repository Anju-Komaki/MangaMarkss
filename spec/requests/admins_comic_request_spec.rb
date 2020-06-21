# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Comic controller', type: :request do
  describe '管理者漫画機能' do
    let(:admin) { create(:admin) }
    let(:comic) { create(:comic) }

    before do
      visit new_admin_session_path
      fill_in 'admin[username]', with: admin.username
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'

      visit new_admins_comic_path
      fill_in 'comic[title]', with: comic.title
      fill_in 'comic[isbn_code]', with: comic.isbn_code
      fill_in 'comic[author]', with: comic.author
      fill_in 'comic[publisher]', with: comic.publisher
      fill_in 'comic[title_en]', with: comic.title_en
      fill_in 'comic[author_en]', with: comic.author_en
      fill_in 'comic[publisher_en]', with: comic.publisher_en
      fill_in 'comic[body]', with: comic.body
      click_button '登録'
    end

    describe '漫画機能一覧' do
      context '表示の確認' do
        it 'お気に入り推移と表示される' do
          visit admins_comics_path
          expect(page).to have_content 'お気に入り推移'
        end
        it 'ISBNコードが表示される' do
          visit admins_comics_path
          expect(page).to have_content comic.isbn_code
        end
        it 'タイトルが表示される' do
          visit admins_comics_path
          expect(page).to have_content comic.title
        end
        it '作者が表示される' do
          visit admins_comics_path
          expect(page).to have_content comic.author
        end
        it '出版社が表示される' do
          visit admins_comics_path
          expect(page).to have_content comic.publisher
        end
        it '編集リンクが表示される' do
          visit admins_comics_path
          expect(page).to have_link 'edit'
        end
        it '削除リンクが表示される' do
          visit admins_comics_path
          expect(page).to have_link 'destroy'
        end
        it '新規追加リンクが表示される' do
          visit admins_comics_path
          expect(page).to have_link '新規追加'
        end
        it 'タグ追加のリンクが表示される' do
          visit admins_comics_path
          expect(page).to have_link 'タグ追加'
        end
      end
    end

    describe '漫画詳細画面' do
      context '表示の確認' do
        it 'ISBNコードが表示される' do
          visit admins_comic_path(comic)
          expect(page).to have_content comic.isbn_code
        end
        it 'タイトルが表示される' do
          visit admins_comics_path
          expect(page).to have_content comic.title
        end
        it 'タイトル(英語)が表示される' do
          visit admins_comic_path(comic)
          expect(page).to have_content comic.title_en
        end
        it '作者が表示される' do
          visit admins_comics_path
          expect(page).to have_content comic.author
        end
        it '作者(英語)が表示される' do
          visit admins_comic_path(comic)
          expect(page).to have_content comic.author_en
        end
        it '出版社(英語)が表示される' do
          visit admins_comic_path(comic)
          expect(page).to have_content comic.publisher_en
        end
        it '出版社が表示される' do
          visit admins_comics_path
          expect(page).to have_content comic.publisher
        end
        it '編集リンクが表示される' do
          visit admins_comics_path
          expect(page).to have_link 'edit'
        end
        it '削除リンクが表示される' do
          visit admins_comics_path
          expect(page).to have_link 'destroy'
        end
      end
    end
  end

  describe '管理者：漫画機能の入力テスト' do
    let(:admin) { create(:admin) }
    let(:comic) { create(:comic) }

    before do
      visit new_admin_session_path
      fill_in 'admin[username]', with: admin.username
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'
    end

    describe '新規追加のテスト' do
      context '表示の確認' do
        it '漫画の新規登録と表示される' do
          visit new_admins_comic_path
          expect(page).to have_content '漫画の新規登録'
        end
        it 'タイトルフォームが表示される' do
          visit new_admins_comic_path
          expect(page).to have_field 'comic[title]'
        end
        it 'タイトル(英語)フォームが表示される' do
          visit new_admins_comic_path
          expect(page).to have_field 'comic[title_en]'
        end
        it 'ISBNコードフォームが表示される' do
          visit new_admins_comic_path
          expect(page).to have_field 'comic[isbn_code]'
        end
        it '作者フォームが表示される' do
          visit new_admins_comic_path
          expect(page).to have_field 'comic[author]'
        end
        it '作者(英語)フォームが表示される' do
          visit new_admins_comic_path
          expect(page).to have_field 'comic[author_en]'
        end
        it '出版社フォームが表示される' do
          visit new_admins_comic_path
          expect(page).to have_field 'comic[publisher]'
        end
        it '出版社(英語)フォームが表示される' do
          visit new_admins_comic_path
          expect(page).to have_field 'comic[publisher_en]'
        end
        it '概要編集フォームが表示される' do
          visit new_admins_comic_path
          expect(page).to have_field 'comic[body]'
        end
      end

      context '漫画の新規追加' do
        it '追加に成功する' do
          visit new_admins_comic_path
          fill_in 'comic[title]', with: comic.title
          fill_in 'comic[isbn_code]', with: comic.isbn_code
          fill_in 'comic[author]', with: comic.author
          fill_in 'comic[publisher]', with: comic.publisher
          fill_in 'comic[title_en]', with: comic.title_en
          fill_in 'comic[author_en]', with: comic.author_en
          fill_in 'comic[publisher_en]', with: comic.publisher_en
          fill_in 'comic[body]', with: comic.body
          click_button '登録'

          expect(page).to have_content '新規登録しました'
        end

        it '追加に失敗する' do
          visit new_admins_comic_path
          fill_in 'comic[title]', with: ''
          fill_in 'comic[isbn_code]', with: ''
          fill_in 'comic[author]', with: ''
          fill_in 'comic[publisher]', with: ''
          fill_in 'comic[title_en]', with: ''
          fill_in 'comic[author_en]', with: ''
          fill_in 'comic[publisher_en]', with: ''
          fill_in 'comic[body]', with: ''
          click_button '登録'

          expect(page).to have_content '新規登録できませんでした'
        end
      end
    end

    describe '編集のテスト' do
      before do
        visit new_admins_comic_path
        fill_in 'comic[title]', with: comic.title
        fill_in 'comic[isbn_code]', with: comic.isbn_code
        fill_in 'comic[author]', with: comic.author
        fill_in 'comic[publisher]', with: comic.publisher
        fill_in 'comic[title_en]', with: comic.title_en
        fill_in 'comic[author_en]', with: comic.author_en
        fill_in 'comic[publisher_en]', with: comic.publisher_en
        fill_in 'comic[body]', with: comic.body
        click_button '登録'
      end

      context '表示の確認' do
        it '漫画の情報編集と表示される' do
          visit edit_admins_comic_path(comic)
          expect(page).to have_content '漫画の情報編集'
        end
        it 'タイトル編集フォームが表示される' do
          visit edit_admins_comic_path(comic)
          expect(page).to have_field 'comic[title]', with: comic.title
        end
        it 'タイトル(英語)編集フォームが表示される' do
          visit edit_admins_comic_path(comic)
          expect(page).to have_field 'comic[title_en]', with: comic.title_en
        end
        it 'ISBNコード編集フォームが表示される' do
          visit edit_admins_comic_path(comic)
          expect(page).to have_field 'comic[isbn_code]', with: comic.isbn_code
        end
        it '作者編集フォームが表示される' do
          visit edit_admins_comic_path(comic)
          expect(page).to have_field 'comic[author]', with: comic.author
        end
        it '作者(英語)編集フォームが表示される' do
          visit edit_admins_comic_path(comic)
          expect(page).to have_field 'comic[author_en]', with: comic.author_en
        end
        it '出版社編集フォームが表示される' do
          visit edit_admins_comic_path(comic)
          expect(page).to have_field 'comic[publisher]', with: comic.publisher
        end
        it '出版社(英語)編集フォームが表示される' do
          visit edit_admins_comic_path(comic)
          expect(page).to have_field 'comic[publisher_en]', with: comic.publisher_en
        end
        it '概要編集フォームが表示される' do
          visit edit_admins_comic_path(comic)
          expect(page).to have_field 'comic[body]', with: comic.body
        end
      end

      context '漫画の情報編集' do
        it '編集に成功する' do
          visit edit_admins_comic_path(comic)
          fill_in 'comic[title]', with: comic.title
          fill_in 'comic[isbn_code]', with: comic.isbn_code
          fill_in 'comic[author]', with: comic.author
          fill_in 'comic[publisher]', with: comic.publisher
          fill_in 'comic[title_en]', with: comic.title_en
          fill_in 'comic[author_en]', with: comic.author_en
          fill_in 'comic[publisher_en]', with: comic.publisher_en
          fill_in 'comic[body]', with: comic.body
          click_button '更新'

          expect(page).to have_content '情報を更新しました'
        end

        it '編集に失敗する' do
          visit edit_admins_comic_path(comic)
          fill_in 'comic[title]', with: ''
          fill_in 'comic[isbn_code]', with: ''
          fill_in 'comic[author]', with: ''
          fill_in 'comic[publisher]', with: ''
          fill_in 'comic[title_en]', with: ''
          fill_in 'comic[author_en]', with: ''
          fill_in 'comic[publisher_en]', with: ''
          fill_in 'comic[body]', with: ''
          click_button '更新'

          expect(page).to have_content '情報を更新できませんでした'
        end
      end
    end
  end
end
