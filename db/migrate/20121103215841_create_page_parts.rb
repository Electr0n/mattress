class CreatePageParts < ActiveRecord::Migration
  def change
    create_table :page_parts do |t|
      t.string :key
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :page_parts, :key
  end
end
