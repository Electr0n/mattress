class AddIntroToPageParts < ActiveRecord::Migration
  def change
    add_column :page_parts, :intro, :text
  end
end
