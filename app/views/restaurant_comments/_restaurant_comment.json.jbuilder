json.extract! restaurant_comment, :id, :user_id, :restaurant_id, :comment, :created_at, :updated_at
json.url restaurant_comment_url(restaurant_comment, format: :json)
