class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :logo

      t.timestamps
    end
  end
end
