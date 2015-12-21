# encoding: UTF-8
namespace :manufacturers do
  desc 'update or create default manufacturers'
  task :update => :environment do
    [
      ['Vegas', 'img/vegas.png'],
      ['Kondor', 'img/kondor.png'],
      ['Цветные сны', 'img/sn.png'],
      ['Барро', 'img/barro.png'],
    ].each do |array|
      puts "Updating #{array[0]}"
      manufacturer = Manufacturer.find_or_create_by_name(array[0])
      manufacturer.update_attributes(logo: File.open(Rails.root.join('public', array[1])))
    end
  end
end
