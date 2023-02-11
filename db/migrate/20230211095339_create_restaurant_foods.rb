class CreateRestaurantFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_foods do |t|
      t.integer :restaurant_id
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
