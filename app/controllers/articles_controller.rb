class ArticlesController < ApplicationController
  before_action :move_to_signed_in
  before_action :find_article, only: [:show, :edit, :update, :destroy]
 #  before_action :current_user, only: [:edit, :update, :destroy]
 
  
 
   def index
     @articles = Article.order(created_at: :desc).page(params[:page]).per(2)
     @article = Article.new
     @categories = Category.all
     
     respond_to do |format|
      format.html
      format.js
    end
   end
 
   def show
     @article = Article.find(params[:id])
     @articles = Article.all.order(created_at: :desc)
     @categories = Category.all
   end
 
   def edit
    @article = Article.find(params[:id])
   end
 
   def new
     # render :layout => false
     @article = Article.new
     @article.article_category_relationships.build
   end
 
   def update
    @articles = Article.order(created_at: :desc)
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article } # showアクションを実行し、詳細ページを表示
        format.js 
      else
        format.html { render :new } # new.html.erbを表示
        format.js  { render :errors } # errors.js.erbが呼び出される
      end
    end
   end
  #  def update
  #    if @article.update(article_params)
  #        redirect_to @article
  #    else
  #        # render "edit", alert: "更新でけへんかった"
  #    end
  #  end
 

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        @articles = Article.all.order(created_at: :desc)
        format.html { redirect_to @article } # showアクションを実行し、詳細ページを表示
        format.js   # update.js.erbが呼び出される
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