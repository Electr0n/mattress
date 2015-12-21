class CreateProductSeries < ActiveRecord::Migration
  def change
    create_table :product_series do |t|
      t.string :title
      t.references :manufacturer

      t.timestamps
    end
    add_index :product_series, :title
    add_index :product_series, :manufacturer_id
  end
end
