module ArticlesHelper
#記事の一部を表示
  def description(article)
    strip_tags(article.body.to_s).gsub(/[\n]/,"").strip.truncate(40)
  end
end
