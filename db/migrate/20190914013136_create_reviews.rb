class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :content 
      t.integer :rating 
      t.integer :restaurant_id 
      t.integer :reviewer_id 

      t.timestamps
    end
  end
end
