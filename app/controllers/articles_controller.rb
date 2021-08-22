class ArticlesController < ApplicationController
  # before_action :move_to_signed_in
  before_action :find_article, only: [:show, :edit, :update, :destroy]
 #  before_action :current_user, only: [:edit, :update, :destroy]
 
 include ArticlesHelper
 
   def index
    @article = Article.new
    get_aside_contents
    if params[:category_id]
      @selected_category = Category.find(params[:category_id])
      @articles= Article.from_category(params[:category_id]).page(params[:page]).per(2)
    else
      @articles = Article.order(created_at: :desc).page(params[:page]).per(2)
    end

    #  respond_to do |format|
    #   format.html
    #   format.js
    # end
   end
 
   def show
     @article = Article.find(params[:id])
     get_aside_contents
   end
 
   def edit
    @article = Article.find(params[:id])
   end
 
   def new
     @article = Article.new
     @article.article_category_relationships.build
   end
 
   def update
    @article = Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
      get_aside_contents
        format.html { redirect_to @article } # showアクションを実行し、詳細ページを表示
        format.js 
      else
        format.html { render :new } # new.html.erbを表示
        format.js  { render :errors } # errors.js.erbが呼び出される
      end
    end
   end
 


  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        get_aside_contents
        @articles = Article.order(created_at: :desc).page(params[:page]).per(2)
        format.html { redirect_to @article } # showアクションを実行し、詳細ページを表示
        format.js   # create.js.erbが呼び出される
      else
        format.html { render :new } # new.html.erbを表示
        format.js { render :errors } # errors.js.erbが呼び出される
      end
    end
  end
 
   def destroy
     # Article.find(params[:id]).destroy
     @article.destroy!
       redirect_to articles_url
     # else
     #   redirect_to root_url, alert: "削除できませんでした"
     # end
   end


   
 
   private
 
   def find_article
     @article = Article.find(params[:id])
   end
 
   def article_params
     params.require(:article).permit(:title, :body, :image, category_ids: [])
   end
 
   def move_to_signed_in
     unless logged_in?
       #サインインしていないユーザーはログインページが表示される
       flash[:danger] = "ログインしてません"
       redirect_to  login_url
     end
   end
end