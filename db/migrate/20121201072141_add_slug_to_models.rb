class AddSlugToModels < ActiveRecord::Migration
  def change
    %w[product_series mattresses page_parts manufacturers].each do |table|
      add_column table, :slug, :string
      add_index table, :slug
      puts "Updating slugs for #{table}"
      table.classify.constantize.find_each(&:save)
    end
  end
end
