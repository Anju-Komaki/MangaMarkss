# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'アソシエーションのテスト' do
    let(:user) { create(:user) }

    context 'Comicモデルとの関係' do
      it '1:Nの関係になっている' do
        expect(User.reflect_on_association(:comics).macro).to eq :has_many
      end
    end

    context 'Commentモデルとの関係' do
      it '1:Nの関係になっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context 'bookmarkモデルとの関係' do
      it '1:Nの関係になっている' do
        expect(User.reflect_on_association(:bookmarks).macro).to eq :has_many
      end
    end

    context 'clipsモデルとの関係' do
      it '1:Nの関係になっている' do
        expect(User.reflect_on_association(:clips).macro).to eq :has_many
      end
    end

    context 'Relationshipモデルとの関係' do
      it 'フォローフォロワーの関連づけ' do
        expect(User.reflect_on_association(:following_relationships).macro).to eq :has_many
        expect(User.reflect_on_association(:following).macro).to eq :has_many
        expect(User.reflect_on_association(:follower_relationships).macro).to eq :has_many
        expect(User.reflect_on_association(:followers).macro).to eq :has_many
      end
    end

    context 'Notificationモデルとの関係' do
      it '通知の受け取り受け渡しの関連づけ' do
        expect(User.reflect_on_association(:active_notifications).macro).to eq :has_many
        expect(User.reflect_on_association(:passive_notifications).macro).to eq :has_many
      end
    end
  end
end
