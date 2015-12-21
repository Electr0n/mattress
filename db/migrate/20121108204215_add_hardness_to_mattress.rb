class AddHardnessToMattress < ActiveRecord::Migration
  def change
    add_column :mattresses, :hardness, :string
  end
end
