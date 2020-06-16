require 'rails_helper'

RSpec.describe Relationship, type: :model do
	describe 'アソシエーションのテスト' do
		context '通知の関連づけ' do
			it '通知の受け取り受け渡しの関連づけ' do
				expect(Notification.reflect_on_association(:visitor).macro).to eq :belongs_to
				expect(Notification.reflect_on_association(:visited).macro).to eq :belongs_to
			end
		end
	end
end