require 'test_helper'

class RestaurantFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant_food = restaurant_foods(:one)
  end

  test "should get index" do
    get restaurant_foods_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_food_url
    assert_response :success
  end

  test "should create restaurant_food" do
    assert_difference('RestaurantFood.count') do
      post restaurant_foods_url, params: { restaurant_food: { description: @restaurant_food.description, name: @restaurant_food.name, restaurant_id: @restaurant_food.restaurant_id } }
    end

    assert_redirected_to restaurant_food_url(RestaurantFood.last)
  end

  test "should show restaurant_food" do
    get restaurant_food_url(@restaurant_food)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_food_url(@restaurant_food)
    assert_response :success
  end

  test "should update restaurant_food" do
    patch restaurant_food_url(@restaurant_food), params: { restaurant_food: { description: @restaurant_food.description, name: @restaurant_food.name, restaurant_id: @restaurant_food.restaurant_id } }
    assert_redirected_to restaurant_food_url(@restaurant_food)
  end

  test "should destroy restaurant_food" do
    assert_difference('RestaurantFood.count', -1) do
      delete restaurant_food_url(@restaurant_food)
    end

    assert_redirected_to restaurant_foods_url
  end
end
