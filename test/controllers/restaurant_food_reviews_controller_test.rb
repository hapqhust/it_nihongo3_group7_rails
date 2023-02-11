require 'test_helper'

class RestaurantFoodReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant_food_review = restaurant_food_reviews(:one)
  end

  test "should get index" do
    get restaurant_food_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_food_review_url
    assert_response :success
  end

  test "should create restaurant_food_review" do
    assert_difference('RestaurantFoodReview.count') do
      post restaurant_food_reviews_url, params: { restaurant_food_review: { restaurant_food_id: @restaurant_food_review.restaurant_food_id, review: @restaurant_food_review.review, user_id: @restaurant_food_review.user_id } }
    end

    assert_redirected_to restaurant_food_review_url(RestaurantFoodReview.last)
  end

  test "should show restaurant_food_review" do
    get restaurant_food_review_url(@restaurant_food_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_food_review_url(@restaurant_food_review)
    assert_response :success
  end

  test "should update restaurant_food_review" do
    patch restaurant_food_review_url(@restaurant_food_review), params: { restaurant_food_review: { restaurant_food_id: @restaurant_food_review.restaurant_food_id, review: @restaurant_food_review.review, user_id: @restaurant_food_review.user_id } }
    assert_redirected_to restaurant_food_review_url(@restaurant_food_review)
  end

  test "should destroy restaurant_food_review" do
    assert_difference('RestaurantFoodReview.count', -1) do
      delete restaurant_food_review_url(@restaurant_food_review)
    end

    assert_redirected_to restaurant_food_reviews_url
  end
end
