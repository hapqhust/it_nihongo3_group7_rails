class AddDescription2 < ActiveRecord::Migration[6.0]
  def change
      add_column :restaurants, :description2, :text
  end
end
