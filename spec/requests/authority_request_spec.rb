require 'rails_helper'

describe 'ユーザの権限テスト' do
	let!(:user) { create(:user) }
	let!(:comic) { create(:comic) }
	describe 'ログインしていない場合' do
		context '漫画関連URLにアクセス' do
			it 'トレンド画面に遷移できない' do
				visit rank_path
				expect(current_path).to eq('/users/sign_in')
			end
			it '漫画一覧に遷移できない' do
				visit comics_path
				expect(current_path).to eq('/users/sign_in')
			end
		end
	end
end

describe '管理者の権限テスト' do
	let!(:admin) { create(:admin) }
	let!(:user) { create(:user) }
	let!(:comic) { create(:comic) }
	let!(:tag) { create(:tag) }
	let!(:category) { create(:category) }
	let!(:information) { create(:information) }
	describe 'ログインしていない場合' do
		context '漫画関連URLのアクセス' do
			it '漫画一覧に遷移できない' do
				visit admins_comics_path
				expect(current_path).to eq('/admins/sign_in')
			end
			it '漫画詳細画面に遷移できない' do
				visit admins_comic_path(comic.id)
				expect(current_path).to eq('/admins/sign_in')
			end
			it '漫画新規登録画面に遷移できない' do
				visit new_admins_comic_path
				expect(current_path).to eq('/admins/sign_in')
			end
			it '漫画編集画面に遷移できない' do
				visit edit_admins_comic_path(comic.id)
				expect(current_path).to eq('/admins/sign_in')
			end
		end
		context 'ユーザ関連URLのアクセス' do
			it 'ユーザ一覧に遷移できない' do
				visit admins_users_path
				expect(current_path).to eq('/admins/sign_in')
			end
			it 'ユーザ詳細画面に遷移できない' do
				visit admins_user_path(user.id)
				expect(current_path).to eq('/admins/sign_in')
			end
			it 'ユーザ編集画面に遷移できない' do
				visit edit_admins_user_path(user.id)
				expect(current_path).to eq('/admins/sign_in')
			end
		end
		context 'お知らせ関連URLのアクセス' do
			it 'お知らせ一覧に遷移できない' do
				visit admins_informations_path
				expect(current_path).to eq('/admins/sign_in')
			end
			it 'お知らせ詳細画面に遷移できない' do
				visit admins_information_path(information.id)
				expect(current_path).to eq('/admins/sign_in')
			end
			it 'お知らせ新規登録画面に遷移できない' do
				visit new_admins_information_path
				expect(current_path).to eq('/admins/sign_in')
			end
			it 'お知らせ編集画面に遷移できない' do
				visit edit_admins_information_path(information.id)
				expect(current_path).to eq('/admins/sign_in')
			end
		end
		context 'タグ関連URL' do
			it 'タグ一覧に遷移できない' do
				visit admins_tags_path
				expect(current_path).to eq('/admins/sign_in')
			end
			it 'タグ編集画面に遷移できない' do
				visit edit_admins_tag_path(tag.id)
				expect(current_path).to eq('/admins/sign_in')
			end
		end
		context 'カテゴリー関連URL' do
			it 'カテゴリー一覧に遷移できない' do
				visit admins_categories_path
				expect(current_path).to eq('/admins/sign_in')
			end
			it 'カテゴリー編集画面に遷移できない' do
				visit edit_admins_category_path(category.id)
				expect(current_path).to eq('/admins/sign_in')
			end
		end
	end
end

describe '言語設定' do
	context '言語指定がない場合' do
		it 'デフォルトが日本語となっている' do
			get '/'
			expect(I18n.locale).to eq :ja
		end
	end
	context '言語指定がある場合' do
		it '英語になっている' do
			get '/en'
			expect(I18n.locale).to eq :en
		end
	end
end