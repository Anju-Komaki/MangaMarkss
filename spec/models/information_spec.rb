require 'rails_helper'

RSpec.describe Information, type: :model do
	describe 'バリデーションのテスト' do
		let(:admin) { create(:admin) }
		let(:information) { build(:information) }

		context '空欄でないこと' do
			it 'タイトル' do
				information.title = ''
				expect(information.valid?).to eq false;
			end
			it '内容' do
				information.body = ''
				expect(information.valid?).to eq false;
			end
		end
	end

	describe 'アソシエーションのテスト' do
		context 'info_categoryモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Information.reflect_on_association(:info_categories).macro).to eq :has_many
			end
		end
		context 'categoryモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Information.reflect_on_association(:categories).macro).to eq :has_many
			end
		end
	end
end