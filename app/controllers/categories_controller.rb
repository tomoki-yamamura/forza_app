class CategoriesController < ApplicationController
  # before_action :find_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.order(created_at: :desc)
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @articles = Article.order(created_at: :desc).limit(5)
    @articles_category = @category.articles.order(created_at: :desc).page(params[:page]).per(2)

    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  private

  # def find_article
  #   @article = Article.find(params[:id])
  # end

  def article_params
    params.require(:article).permit(:title, :body, :image,  category_ids: [])
  end



end
