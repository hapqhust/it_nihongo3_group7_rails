class CreateRestaurantFoodReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_food_reviews do |t|
      t.integer :user_id
      t.integer :restaurant_food_id
      t.text :review

      t.timestamps
    end
  end
end
