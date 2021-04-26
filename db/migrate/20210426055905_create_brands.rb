class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.text :name
      t.text :logo
      t.text :description
      t.integer :established
      t.text :image #TODO add array of images as separate column

      t.timestamps
    end
  end
end
