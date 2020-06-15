require 'rails_helper'

RSpec.describe "Users", type: :request do
	describe 'ユーザ新規登録' do
		before do
			visit new_user_registration_path
		end
		context '新規登録画面に遷移' do
			it '新規登録に成功' do
				fill_in 'user[username]', with: Faker::Internet.username(specifier: 5)
				fill_in 'user[email]', with: Faker::Internet.email
				fill_in 'user[password]', with: 'password'
				fill_in 'user[password_confirmation]', with: 'password'
				click_button 'Sign up'

				expect(page).to have_content 'MangaMarks'
			end

			it '新規登録に失敗する' do
				fill_in 'user[username]', with: ''
				fill_in 'user[email]', with: ''
				fill_in 'user[password]', with: ''
				fill_in 'user[password_confirmation]', with: ''
				click_button 'Sign up'

				expect(page).to have_content 'エラー'
			end
		end
	end
	describe 'ユーザーログインテスト' do
		let(:user) { create(:user) }
		before do
			visit new_user_session_path
		end
		context 'ログイン画面に遷移' do
			let(:test_user) { user }
			it 'ログインに成功する' do
				fill_in 'user[username]', with: test_user.username
				fill_in 'user[password]', with: test_user.password
				click_button 'Log in'

				expect(page).to have_content 'MangaMarks'
			end

			it 'ログインに失敗する' do
				fill_in 'user[username]', with: ''
				fill_in 'user[password]', with: ''
				click_button 'Log in'

				expect(current_path).to eq(new_user_session_path)
			end
		end
	end

	describe 'ログイン中のヘッダー' do
		let(:user) { create(:user) }
		before do
			visit new_user_session_path
			fill_in 'user[username]', with: user.username
			fill_in 'user[password]', with: user.password
			click_button 'Log in'
		end
		describe 'ヘッダー' do
			context 'ヘッダーの確認' do
				it 'トップページのリンク表示される' do
					visit root_path
					expect(page).to have_link 'トップページ'
				end
				it '通知のリンク表示される' do
					visit root_path
					expect(page).to have_link '通知'
				end
				it 'トレンドのリンク表示される' do
					visit root_path
					expect(page).to have_link 'トレンド'
				end
				it 'お知らせのリンク表示される' do
					visit root_path
					expect(page).to have_link 'お知らせ'
				end
				it 'マイページのリンク表示される' do
					visit root_path
					expect(page).to have_link 'マイページ'
				end
				it 'ログアウトのリンク表示される' do
					visit root_path
					expect(page).to have_link 'ログアウト'
				end
				it '言語切り替えのタブメニュー表示される' do
					visit root_path
					expect(page).to have_link 'Laungage'
				end
				it '検索ボタンの表示' do
					visit root_path
					expect(page).to have_button '検索'
				end
			end
		end
	end
end
