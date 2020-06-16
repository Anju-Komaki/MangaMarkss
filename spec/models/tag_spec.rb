require 'rails_helper'

RSpec.describe Tag, type: :model do
	describe 'バリデーションのテスト' do
		let(:admin) { create(:admin) }
		let(:tag) { build(:tag) }

		context '空欄でないこと' do
			it 'タグ名' do
				tag.name = ''
				expect(tag.valid?).to eq false;
			end
		end
	end
	describe 'アソシエーションのテスト' do
		context 'Comicモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Tag.reflect_on_association(:comics).macro).to eq :has_many
			end
		end
		context 'Comic_tagsモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Tag.reflect_on_association(:comic_tags).macro).to eq :has_many
			end
		end
	end
end