# encoding: UTF-8
namespace :seos do
  desc 'update or create default page parts'
  task :update => :environment do
    %w[
      Manufacturer
      ProductSeries
      Mattress
      PagePart
    ].each do |type|
      puts "Updating seo for #{type}"
      page_part = Seo.find_or_create_by_model_type("#{type}")
    end
  end
end
