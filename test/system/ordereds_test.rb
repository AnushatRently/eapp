require "application_system_test_case"

class OrderedsTest < ApplicationSystemTestCase
  setup do
    @ordered = ordereds(:one)
  end

  test "visiting the index" do
    visit ordereds_url
    assert_selector "h1", text: "Ordereds"
  end

  test "creating a Ordered" do
    visit ordereds_url
    click_on "New Ordered"

    fill_in "Order item", with: @ordered.order_item_id
    fill_in "Total", with: @ordered.total
    fill_in "User", with: @ordered.user_id
    click_on "Create Ordered"

    assert_text "Ordered was successfully created"
    click_on "Back"
  end

  test "updating a Ordered" do
    visit ordereds_url
    click_on "Edit", match: :first

    fill_in "Order item", with: @ordered.order_item_id
    fill_in "Total", with: @ordered.total
    fill_in "User", with: @ordered.user_id
    click_on "Update Ordered"

    assert_text "Ordered was successfully updated"
    click_on "Back"
  end

  test "destroying a Ordered" do
    visit ordereds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ordered was successfully destroyed"
  end
end
