json.extract! restaurant_food_review, :id, :user_id, :restaurant_food_id, :review, :created_at, :updated_at
json.url restaurant_food_review_url(restaurant_food_review, format: :json)
