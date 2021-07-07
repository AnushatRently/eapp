require "test_helper"

class MyordersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myorders_index_url
    assert_response :success
  end
end
