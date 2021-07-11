class ForzaController < ApplicationController
  def home
    @top_news = Article.recent_article
  end

  def about
  end

  def news
  end

  def contact
  end


end
