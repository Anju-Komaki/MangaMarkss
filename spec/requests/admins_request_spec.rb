require 'rails_helper'

RSpec.describe "Admin", type: :request do
	describe '管理者画面ログインテスト' do
		let(:admin) { create(:admin) }
		before do
			new_admin_session_path
		end
		context 'ログイン画面に遷移' do
			let(:admin) { create(:admin) }
			it 'ログインに成功する' do
				visit new_admin_session_path
				fill_in 'admin[username]', with: admin.username
				fill_in 'admin[password]', with: admin.password
				click_button 'ログイン'

				expect(page).to have_content 'MangaMarks'
			end

			it 'ログインに失敗する' do
				visit new_admin_session_path
				fill_in 'admin[username]', with: ''
				fill_in 'admin[password]', with: ''
				click_button 'ログイン'

				expect(current_path).to eq(new_admin_session_path)
			end
		end
	end

	describe '管理者画面ログイン中のヘッダー' do
		let(:admin) { create(:admin) }
		before do
			visit new_admin_session_path
			fill_in 'admin[username]', with: admin.username
			fill_in 'admin[password]', with: admin.password
			click_button 'ログイン'
		end
		describe '管理者ヘッダー' do
			context '表示の確認' do
				it '漫画機能のリンク表示される' do
					visit root_path
					expect(page).to have_link '漫画'
				end
				it '会員機能のリンク表示される' do
					visit root_path
					expect(page).to have_link '会員'
				end
				it 'お知らせ機能のリンク表示される' do
					visit root_path
					expect(page).to have_link 'お知らせ'
				end
				it 'ログアウトのリンク表示される' do
					visit root_path
					expect(page).to have_link 'ログアウト'
				end
				it '検索ボタンが表示される' do
					visit root_path
					expect(page).to have_button '検索'
				end
			end
		end
	end
end