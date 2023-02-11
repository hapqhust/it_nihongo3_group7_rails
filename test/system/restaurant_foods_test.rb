require "application_system_test_case"

class RestaurantFoodsTest < ApplicationSystemTestCase
  setup do
    @restaurant_food = restaurant_foods(:one)
  end

  test "visiting the index" do
    visit restaurant_foods_url
    assert_selector "h1", text: "Restaurant Foods"
  end

  test "creating a Restaurant food" do
    visit restaurant_foods_url
    click_on "New Restaurant Food"

    fill_in "Description", with: @restaurant_food.description
    fill_in "Name", with: @restaurant_food.name
    fill_in "Restaurant", with: @restaurant_food.restaurant_id
    click_on "Create Restaurant food"

    assert_text "Restaurant food was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant food" do
    visit restaurant_foods_url
    click_on "Edit", match: :first

    fill_in "Description", with: @restaurant_food.description
    fill_in "Name", with: @restaurant_food.name
    fill_in "Restaurant", with: @restaurant_food.restaurant_id
    click_on "Update Restaurant food"

    assert_text "Restaurant food was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaurant food" do
    visit restaurant_foods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaurant food was successfully destroyed"
  end
end
