class AddBigImageToMattress < ActiveRecord::Migration
  def change
    add_column :mattresses, :big_image, :string
  end
end
