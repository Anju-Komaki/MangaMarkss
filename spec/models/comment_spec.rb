require 'rails_helper'

RSpec.describe Comment, type: :model do
	describe 'バリデーションのテスト' do
		let(:user) { create(:user) }
		let(:comment) { build(:comment) }

		context '空欄でないこと' do
			it 'コメント' do
				comment.comment = ''
				expect(comment.valid?).to eq false;
			end
			it '星評価' do
				comment.rate = ''
				expect(comment.valid?).to eq false;
			end
		end
	end

	describe 'アソシエーションのテスト' do
		context 'Userモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
			end
		end
		context 'Comicモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Comment.reflect_on_association(:comic).macro).to eq :belongs_to
			end
		end
	end
end