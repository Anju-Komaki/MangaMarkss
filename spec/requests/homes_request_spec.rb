require 'rails_helper'

describe 'トップページのテスト' do
	describe 'トップページ' do
		before do
			root_path
		end
		context '表示の確認' do
			it 'ランキングと表示される' do
				visit root_path
				expect(page).to have_content 'ランキング'
			end
			it 'お知らせと表示される' do
				visit root_path
				expect(page).to have_content 'お知らせ'
			end
		end
	end

	describe 'アバウトページ' do
		before do
			homes_about_path
		end
		context '表示の確認' do
			it 'MangaMarksと表示される' do
				visit homes_about_path
				expect(page).to have_content 'MangaMarks'
			end
			it 'このアプリでできることと表示' do
				visit homes_about_path
				expect(page).to have_content 'このアプリでできること'
			end
			it 'アイコンについて表示' do
				visit homes_about_path
				expect(page).to have_content 'アイコンについて'
			end
		end
	end

describe 'ヘッダー' do
	describe '非ログインユーザーのヘッダーの確認' do
		before do
			root_path
		end
		context '表示の確認' do
			it 'トップページのリンクが表示' do
				visit root_path
				expect(page).to have_link 'トップページ'
			end
			it 'アバウトページのリンクが表示' do
				visit root_path
				expect(page).to have_link 'アバウト'
			end
			it '新規登録のリンクが表示' do
				visit root_path
				expect(page).to have_link '新規登録'
			end
			it 'ログインのリンクが表示' do
				visit root_path
				expect(page).to have_link 'ログイン'
			end
			it '言語切り替えのタブメニューが表示' do
				visit root_path
				expect(page).to have_link 'Laungage'
			end
		end
	end
end
end