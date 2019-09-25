class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :type
      t.string :location
      t.integer :price_range

      t.timestamps
    end
  end
end
