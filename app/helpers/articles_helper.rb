module ArticlesHelper
#記事の一部を表示(home画面)
  def description(article)
    strip_tags(article.body.to_s).gsub(/[\n]/,"").strip.truncate(40)
  end

  # container_rightの情報を取得する
  def get_aside_contents
    @recent_entries = Article.recent_article
    @categories = Category.all
  end

end
