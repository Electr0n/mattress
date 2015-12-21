class CreateMattressStuffSizes < ActiveRecord::Migration
  def change
    create_table :mattress_stuff_sizes do |t|
      t.integer :height
      t.integer :width

      t.timestamps
    end
    add_index :mattress_stuff_sizes, :height
    add_index :mattress_stuff_sizes, :width
  end
end
