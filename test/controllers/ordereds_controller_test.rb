require "test_helper"

class OrderedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ordered = ordereds(:one)
  end

  test "should get index" do
    get ordereds_url
    assert_response :success
  end

  test "should get new" do
    get new_ordered_url
    assert_response :success
  end

  test "should create ordered" do
    assert_difference('Ordered.count') do
      post ordereds_url, params: { ordered: { order_item_id: @ordered.order_item_id, total: @ordered.total, user_id: @ordered.user_id } }
    end

    assert_redirected_to ordered_url(Ordered.last)
  end

  test "should show ordered" do
    get ordered_url(@ordered)
    assert_response :success
  end

  test "should get edit" do
    get edit_ordered_url(@ordered)
    assert_response :success
  end

  test "should update ordered" do
    patch ordered_url(@ordered), params: { ordered: { order_item_id: @ordered.order_item_id, total: @ordered.total, user_id: @ordered.user_id } }
    assert_redirected_to ordered_url(@ordered)
  end

  test "should destroy ordered" do
    assert_difference('Ordered.count', -1) do
      delete ordered_url(@ordered)
    end

    assert_redirected_to ordereds_url
  end
end
