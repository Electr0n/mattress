class CreateSeos < ActiveRecord::Migration
  def change
    create_table :seos do |t|
      t.string :title
      t.string :slug
      t.string :keywords
      t.string :description
      t.string :model_type
      t.integer :model_id

      t.timestamps
    end
    add_index :seos, :model_type
    add_index :seos, :model_id
  end
end
