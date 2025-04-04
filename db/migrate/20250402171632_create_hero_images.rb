class CreateHeroImages < ActiveRecord::Migration[8.0]
  def change
    create_table :hero_images do |t|
      t.text :image_data

      t.timestamps
    end
  end
end
