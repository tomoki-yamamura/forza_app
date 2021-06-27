require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
   # newアクション(/login)に対してのテスト
  test "should get new" do 
     # /loginにgetリクエストを送る（取得）
    get login_path 
     # レスポンスが成功したらtrue、失敗ならfalse
    assert_response :success  
  end
end
