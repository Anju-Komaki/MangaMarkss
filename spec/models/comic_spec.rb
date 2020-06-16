require 'rails_helper'

RSpec.describe Comic, type: :model do
	describe 'バリデーションのテスト' do
		let(:admin) { create(:admin) }
		let(:comic) { build(:comic) }

		context '空欄でないこと' do
			it 'タイトル' do
				comic.title = ''
				expect(comic.valid?).to eq false;
			end
			it 'タイトル(英語)' do
				comic.title_en = ''
				expect(comic.valid?).to eq false;
			end
			it 'ISBNコード' do
				comic.isbn_code = ''
				expect(comic.valid?).to eq false;
			end
			it '作者' do
				comic.author = ''
				expect(comic.valid?).to eq false;
			end
			it '作者(英語)' do
				comic.author_en = ''
				expect(comic.valid?).to eq false;
			end
			it '出版社' do
				comic.publisher = ''
				expect(comic.valid?).to eq false;
			end
			it '出版社(英語)' do
				comic.publisher_en = ''
				expect(comic.valid?).to eq false;
			end
			it '概要' do
				comic.body = ''
				expect(comic.valid?).to eq false;
			end
		end
	end

	describe 'アソシエーションのテスト' do
		context 'Userモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Comic.reflect_on_association(:user).macro).to eq :belongs_to
			end
		end
		context 'Commnetモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Comic.reflect_on_association(:comments).macro).to eq :has_many
			end
		end
		context 'bookmarkモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Comic.reflect_on_association(:bookmarks).macro).to eq :has_many
			end
		end
		context 'clipモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Comic.reflect_on_association(:clips).macro).to eq :has_many
			end
		end
		context 'comic_tagsモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Comic.reflect_on_association(:comic_tags).macro).to eq :has_many
			end
		end
		context 'tagsモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Comic.reflect_on_association(:tags).macro).to eq :has_many
			end
		end
	end

end