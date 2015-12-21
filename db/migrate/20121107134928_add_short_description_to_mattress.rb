class AddShortDescriptionToMattress < ActiveRecord::Migration
  def change
    add_column :mattresses, :short_description, :text
  end
end
