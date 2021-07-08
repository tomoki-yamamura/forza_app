class ArticlesController < ApplicationController
 before_action :move_to_signed_in
 before_action :find_article, only: [:show, :edit, :update, :destroy]
 

  def index
    @articles = Article.order(created_at: :desc).limit(5)
    @categories = Category.all
  end

  def show
    @article = Article.find(params[:id])
    @categories = @article.categories
  end

  def edit
  end

  def new
    @article = Article.new
    @article.article_category_relationships.build
  end

  def update
    if @article.update(article_params)
        redirect_to @article, notice: "更新できたよ"
    else
        render "edit", alert: "更新でけへんかった"
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "作成できたよ"
    else
        render "new", alert: "作成できませんでした"
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_url, notice: "削除できたよ"
    else
      redirect_to root_url, alert: "削除でけへん"
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :image,  category_ids: [])
  end

  def move_to_signed_in
    unless logged_in?
      #サインインしていないユーザーはログインページが表示される
      flash[:danger] = "ログインしてません"
      redirect_to  login_url
    end
  end

end
