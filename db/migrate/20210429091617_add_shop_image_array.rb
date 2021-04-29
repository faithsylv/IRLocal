class AddShopImageArray < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :images, :text, :array => true, :default => []
  end
end
