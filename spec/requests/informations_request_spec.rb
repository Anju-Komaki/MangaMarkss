require 'rails_helper'

RSpec.describe "Admin::Information controller", type: :request do
describe 'お知らせのテスト' do
	let(:admin) { create(:admin) }
	let(:information) { create(:information) }
	describe 'お知らせ一覧' do
		before do
			visit new_admin_session_path
			fill_in 'admin[username]', with: admin.username
			fill_in 'admin[password]', with: admin.password
			click_button 'ログイン'

			visit new_admins_information_path
			fill_in 'information[title]', with: information.title
			fill_in 'information[body]', with: information.body
			click_button '保存'

			informations_path
		end
		context '表示の確認' do
			it 'お知らせと表示される' do
				visit informations_path
				expect(page).to have_content 'お知らせ'
			end
			it 'お知らせのタイトルが表示される' do
				visit informations_path
				expect(page).to have_content information.title
			end
			it 'お知らせの内容の一部が表示される' do
				visit informations_path
				expect(page).to have_content information.body
			end
		end
	end
end
end