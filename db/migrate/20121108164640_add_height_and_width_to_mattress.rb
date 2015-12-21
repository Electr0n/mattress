class AddHeightAndWidthToMattress < ActiveRecord::Migration
  def change
    add_column :mattresses, :width, :string
    add_column :mattresses, :height, :string
  end
end
