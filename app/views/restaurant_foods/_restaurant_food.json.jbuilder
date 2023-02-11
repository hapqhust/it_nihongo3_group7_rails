json.extract! restaurant_food, :id, :restaurant_id, :name, :description, :created_at, :updated_at
json.url restaurant_food_url(restaurant_food, format: :json)
