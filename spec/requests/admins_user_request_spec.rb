require 'rails_helper'

RSpec.describe "Admin::User controller", type: :request do
	describe '管理者会員機能' do
		let(:admin) { create(:admin) }
		let(:user) { create(:user) }
		before do
			visit new_admin_session_path
			fill_in 'admin[username]', with: admin.username
			fill_in 'admin[password]', with: admin.password
			click_button 'ログイン'
		end

		describe '会員一覧' do
			context '表示の確認' do
				it 'CSV出力リンクが表示されている' do
					visit admins_users_path
					expect(page).to have_link 'CSV出力'
				end
			end
		end
	end
end