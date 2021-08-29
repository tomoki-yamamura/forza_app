require "test_helper"

class InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_inquiry_path
    assert_response :success
    assert_select "title", "Contact | Forza App"
  end
end
