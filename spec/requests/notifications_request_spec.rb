require 'rails_helper'

describe '通知機能' do
	let(:user) { create(:user) }
	before do
		visit new_user_session_path
		fill_in 'user[username]', with: user.username
		fill_in 'user[password]', with: user.password
		click_button 'Log in'
	end
	describe '通知の画面' do
		context '表示の確認' do
			it '通知と表示される' do
				visit notifications_path
			    expect(page).to have_content '通知'
			end
			it '全削除のリンクが表示される' do
				visit notifications_path
			    expect(page).to have_link '全削除'
			end
		end
	end
end