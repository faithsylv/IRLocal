class CreateCategoriesShops < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_shops, :id => false do |t|
      t.integer :category_id
      t.integer :shop_id
    end
  end
end
