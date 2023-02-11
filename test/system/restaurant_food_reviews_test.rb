require "application_system_test_case"

class RestaurantFoodReviewsTest < ApplicationSystemTestCase
  setup do
    @restaurant_food_review = restaurant_food_reviews(:one)
  end

  test "visiting the index" do
    visit restaurant_food_reviews_url
    assert_selector "h1", text: "Restaurant Food Reviews"
  end

  test "creating a Restaurant food review" do
    visit restaurant_food_reviews_url
    click_on "New Restaurant Food Review"

    fill_in "Restaurant food", with: @restaurant_food_review.restaurant_food_id
    fill_in "Review", with: @restaurant_food_review.review
    fill_in "User", with: @restaurant_food_review.user_id
    click_on "Create Restaurant food review"

    assert_text "Restaurant food review was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant food review" do
    visit restaurant_food_reviews_url
    click_on "Edit", match: :first

    fill_in "Restaurant food", with: @restaurant_food_review.restaurant_food_id
    fill_in "Review", with: @restaurant_food_review.review
    fill_in "User", with: @restaurant_food_review.user_id
    click_on "Update Restaurant food review"

    assert_text "Restaurant food review was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaurant food review" do
    visit restaurant_food_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaurant food review was successfully destroyed"
  end
end
