class CreateBrandsShops < ActiveRecord::Migration[5.2]
  def change
    create_table :brands_shops, :id => false do |t|
      t.integer :brand_id
      t.integer :shop_id
    end
  end
end
