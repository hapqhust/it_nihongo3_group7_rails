class CreateRestaurantComments < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_comments do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.text :comment

      t.timestamps
    end
  end
end
