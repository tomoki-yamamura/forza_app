require "test_helper"

class ArticlePostTest < ActionDispatch::IntegrationTest
  def setup
    # fixture参照
    @user = users(:forza)
    @article = articless(:article)
  end

  # test "should display create new article button with logged in" do
  #   log_in_as(@user)
  #   get articles_path
  #   assert_template 'articles'
  # end

  # test "shouldnot display create new product button without logged in" do
  #   get products_path
  #   assert_select ".FAB",count: 0
  # end
end
