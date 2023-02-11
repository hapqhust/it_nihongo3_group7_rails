class Restaurant < ApplicationRecord
    has_one_attached :image
    has_many :restaurant_food, -> { order "created_at ASC"}
    has_many :restaurant_comment, -> { order "created_at DESC"}
end
