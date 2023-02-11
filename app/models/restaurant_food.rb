class RestaurantFood < ApplicationRecord
    has_one_attached :image
    has_many :restaurant_food_review, -> { order "created_at DESC"}
end
