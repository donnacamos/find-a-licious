class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ceo
      t.integer :net_worth
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
