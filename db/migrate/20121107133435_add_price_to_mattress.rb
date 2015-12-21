class AddPriceToMattress < ActiveRecord::Migration
  def change
    add_column :mattresses, :price, :integer
  end
end
