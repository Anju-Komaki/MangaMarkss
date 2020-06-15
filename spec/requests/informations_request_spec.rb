require 'rails_helper'

describe 'お知らせのテスト' do
	let(:information) { create(:information) }
	describe 'お知らせ一覧' do
		before do
			informations_path
		end
		context '表示の確認' do
			it 'お知らせと表示される' do
				visit informations_path
				expect(page).to have_content 'お知らせ'
			end
		end
	end
end