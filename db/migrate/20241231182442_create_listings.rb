class CreateListings < ActiveRecord::Migration[8.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.float :rent_amount
      t.integer :bedrooms
      t.integer :bathrooms
      t.float :latitude
      t.float :longitude
      t.boolean :is_available

      t.timestamps
    end
  end
end
