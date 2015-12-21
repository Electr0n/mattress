# encoding: UTF-8
desc 'update or create default data'
  task :update => :environment do
    Rake::Task['page_parts:update'].invoke
    Rake::Task['manufacturers:update'].invoke
    Rake::Task['product_series:update'].invoke
    Rake::Task['seos:update'].invoke
  end
