class CategoriesController < ApplicationController
  # before_action :find_article, only: [:show, :edit, :update, :destroy]
  
  def index
    # @category = Category.find(params[:id])

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

  def create

    
    
    # @article = @category.articles.new(article_params)
    @article = Category.articles.new(article_params)
binding.pry
    @article.save

    redirect_to root_url

    

    # respond_to do |format|
    #   if @article.save
    #     @articles = Article.all.order(created_at: :desc)
    #     format.html { redirect_to @article } # showアクションを実行し、詳細ページを表示
    #     format.js   # create.js.erbが呼び出される
    #   else
    #     format.html { render :new } # new.html.erbを表示
    #     format.js { render :errors } # errors.js.erbが呼び出される
    #   end
    # end
  end

  private

  def article_params
    params.require(:category).permit(:title, :body, :image,  category_ids: [])
  end



end
