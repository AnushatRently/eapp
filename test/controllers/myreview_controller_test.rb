require "test_helper"

class MyreviewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myreview_index_url
    assert_response :success
  end

  test "should get show" do
    get myreview_show_url
    assert_response :success
  end
end
