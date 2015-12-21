class CreateMattressStuffPriceForSizes < ActiveRecord::Migration
  def change
    create_table :mattress_stuff_price_for_sizes do |t|
      t.decimal :price
      t.references :size
      t.references :mattress

      t.timestamps
    end
    add_index :mattress_stuff_price_for_sizes, :mattress_id
    add_index :mattress_stuff_price_for_sizes, :size_id
  end
end
