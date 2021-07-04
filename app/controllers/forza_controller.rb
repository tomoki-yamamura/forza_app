class ForzaController < ApplicationController
  def home
    @articles = Article.all
    
  end

  def about
  end

  def news
  end

  def contact
  end
end
