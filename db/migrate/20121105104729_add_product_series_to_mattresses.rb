class AddProductSeriesToMattresses < ActiveRecord::Migration
  def change
    add_column :mattresses, :product_series_id, :integer
    add_index :mattresses, :product_series_id
  end
end
