class AddImageToMattress < ActiveRecord::Migration
  def change
    add_column :mattresses, :image, :string
  end
end
