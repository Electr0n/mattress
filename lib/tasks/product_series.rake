# encoding: UTF-8
namespace :product_series do
  desc 'update or create default manufacturers'
  task :update => :environment do
    [
      ['К-100', 'Kondor'],
      ['К-200', 'Kondor'],
      ['К-300', 'Kondor'],
      ['К-400', 'Kondor'],
      ['Д-500', 'Kondor'],
      ['Боннель', 'Цветные сны'],
      ['Люкс', 'Цветные сны'],
      ['Латекс', 'Цветные сны'],
      ['Комфорт', 'Vegas'],
      ['Модерн', 'Vegas'],
      ['Эксклюзив', 'Vegas'],
      ['Эколатекс', 'Vegas'],
      ['Актив', 'Vegas'],
      ['Стандарт', 'Vegas'],
      ['Vegas Kids', 'Vegas'],
      ['Комфорт', 'Барро'],
      ['Модерн', 'Барро'],
      ['Эксклюзив', 'Барро'],
      ['Эколатекс', 'Барро'],
    ].each do |array|
      puts "Updating #{array[0]}"
      ps = ProductSeries.find_or_create_by_title_and_manufacturer_id(array[0], Manufacturer.find_by_name(array[1]).try(:id))
    end
  end
end
