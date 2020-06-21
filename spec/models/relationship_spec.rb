# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'アソシエーションのテスト' do
    context 'フォローフォロワーの関連づけ' do
      it 'フォローフォロワーの関連づけ' do
        expect(Relationship.reflect_on_association(:follower).macro).to eq :belongs_to
        expect(Relationship.reflect_on_association(:following).macro).to eq :belongs_to
      end
    end
  end
end
