require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
      password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
first.last@foo.jp alice+bob@baz.cn]
 #5つのアドレスを配列で指定
 #それぞれの要素をブロックvalid_addressに繰り返し代入。一個ずつ検証する。
    valid_addresses.each do |valid_address|
      #@user.emailにブロックを代入                              
      @user.email = valid_address 
      #@userが通ったらtrue、通らなかったらfalse。
      # さらに、第二引数でどのメールアドレスで失敗したかエラーメッセージを追加                  
      assert @user.valid?, "#{valid_address.inspect} should be valid" 
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.   
                           foo@bar_baz.com foo@bar+baz.com] 
    #配列で５つのアドレス指定
     #それぞれの要素をブロックinvalid_addressに繰り返し代入。1つずつ検証。
    invalid_addresses.each do |invalid_address|
       #@user.emailにブロックを代入
      @user.email = invalid_address
      #@userが有効なら失敗、無効なら成功。第二引数で失敗したメールアドレスをそのまま文字列として表示
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"   
    end
  end

  # 一意性の検証--------------------------

  test "email addresses should be unique" do
    #@userを複製する
    duplicate_user = @user.dup
    #@userをデータベースに保存
    @user.save
    #複製したduplicate_userが有効なら失敗、無効なら成功
    assert_not duplicate_user.valid?
  end


  # パスワード関連------------------------
  #passwordとpassword_confirmationが空かどうか検証
  test "password should be present (nonblank)" do 
     #二つの属性に空白文字を6個代入
    @user.password = @user.password_confirmation = " " * 6 
    #@userが有効なら失敗、無効なら成功
    assert_not @user.valid? 
  end

  #passwordとpassword_confirmationが最低6文字以上あるかどうか検証
  test "password should have a minimum length" do  
    #二つの属性に"a"をを5個代入
    @user.password = @user.password_confirmation = "a" * 5
    #@userが有効なら失敗、無効なら成功  
    assert_not @user.valid?  
  end
end

