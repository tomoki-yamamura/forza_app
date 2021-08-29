require 'rails_helper'

RSpec.describe Article, type: :model do


  let!(:category) { Category.create(name: "練習メニュー") }
  let!(:article) { Article.new(params) }
  let!(:params) {{ title: title, body: body, category_ids: category.id}}



  context 'タイトル、bodyがある' do
    let!(:title) { "test" }
    let!(:body) { "test body" }
    it '有効である' do
      expect(article).to be_valid
    end
  end

  context 'タイトルがない' do
    let!(:title) { nil }
    let!(:body) { "test body" }
    it '無効である' do
      expect(article).to_not be_valid
    end
  end

  context 'bodyがない' do
    let!(:title) { "test" }
    let!(:body) { nil }
    it '無効である' do
      expect(article).to_not be_valid
    end
  end





  
end
