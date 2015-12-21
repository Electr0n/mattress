class AddBestSelledToMattress < ActiveRecord::Migration
  def change
    add_column :mattresses, :best_selled_from, :datetime
    add_column :mattresses, :best_selled, :boolean
  end
end
