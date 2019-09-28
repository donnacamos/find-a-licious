class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state_abbreviation
      t.integer :zip_code 
      t.integer :user_id 
      t.integer :restaurant_id 

      t.timestamps
    end
  end
end
