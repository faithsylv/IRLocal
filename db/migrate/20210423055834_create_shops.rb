class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|

      t.text :name
      t.text :logo
      t.text :tagline
      t.text :description
      t.text :founders
      t.integer :established
      t.text :website
      t.text :image #TODO add array of images as separate column
      t.text :address #what about multiple addresses?
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps

    end
  end
end
