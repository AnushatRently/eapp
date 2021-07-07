require "test_helper"

class SellerConsoleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seller_console_index_url
    assert_response :success
  end
end
