class CategoriesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.order(created_at: :desc)
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @categories = @article.categories
  end


end
