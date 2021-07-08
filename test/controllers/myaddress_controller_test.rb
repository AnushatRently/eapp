require "test_helper"

class MyaddressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myaddress_index_url
    assert_response :success
  end
end
