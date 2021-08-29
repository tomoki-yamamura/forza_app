require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  def setup
    @post = Article.new(title: "aiueo", body: "kakikukeko")
  end

  test "should be valid" do
    assert_not @post.valid?
  end

end
