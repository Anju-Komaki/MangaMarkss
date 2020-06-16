require 'rails_helper'

RSpec.describe Clip, type: :model do
	describe 'アソシエーションのテスト' do
		context 'Userモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Clip.reflect_on_association(:user).macro).to eq :belongs_to
			end
		end
		context 'Comicモデルとの関係' do
			it '1:Nの関係になっている' do
				expect(Clip.reflect_on_association(:comic).macro).to eq :belongs_to
			end
		end
	end
end