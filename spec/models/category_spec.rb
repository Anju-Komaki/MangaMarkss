# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'バリデーションのテスト' do
    let(:admin)    { create(:admin)   }
    let(:category) { build(:category) }

    context '空欄でないこと' do
      it 'カテゴリー名' do
        category.name = ''
        expect(category.valid?).to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Informationモデルとの関係' do
      it '1:Nの関係になっている' do
        expect(Category.reflect_on_association(:informations).macro).to eq :has_many
      end
    end

    context 'info_categoriesモデルとの関係' do
      it '1:Nの関係になっている' do
        expect(Category.reflect_on_association(:info_categories).macro).to eq :has_many
      end
    end
  end
end
