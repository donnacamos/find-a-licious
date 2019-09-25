class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :type
      t.string :location
      t.integer :price_range
      t.integer :user_id 
      t.integer :company_id 

      t.timestamps
    end
  end
end
