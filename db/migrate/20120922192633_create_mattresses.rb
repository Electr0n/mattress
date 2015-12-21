class CreateMattresses < ActiveRecord::Migration
  def change
    create_table :mattresses do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
