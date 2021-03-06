# encoding: UTF-8
namespace :fake_mattresses do
  desc 'create fake manufacturers'
  task :create => :environment do
    array = [
      <<-HTML,
        <h3>Характеристики</h3>
        <p>Латексный блок — монолитный блок из натурального гиппоаллергенного латекса, получаемого на основе млечного сока каучукового дерева гевеи. Высота — 100 мм, три зоны жёсткости. Наличие специальной перфорации, воздушных каналов, а также естественной пористой клеточной структуры латекса создаёт отличный микроклимат.</p>
        <p>Кокосовый лист 30 мм — изготавливается из натуральных волокон кокосового ореха, с добавлением натур­ального латекса для скрепления волокон и придания упругости. Придаёт матрацу дополнительную жёсткость.</p>
        <p>Кактусовое волокно — волокно сисаловой пальмы толщиной 20 мм. Изготавливается из экологически чистых материалов с пропиткой натуральным латексом.</p>
        <p>Латексный лист 25мм — 1 лист из натурального гиппоаллергенного латекса, получаемого на основе млечного сока каучукового дерева гевеи. Придаёт матрацу мягкость.</p>
        <p>Хлопковое полотно — полотно, получаемое из натуральных хлопковых волокон, после специальной обработки.</p>
        <p>Чехол матрацный съёмный — изготовлен из ткани BAMBOO (из бамбуковой пряжи) — стеганной на периотеке — вариант ТС, или стёганной частично на шерсти — вариант ТН «зима-лето»</p>
      HTML
      <<-HTML
        <p>Латексная плита — (из натурального латекса) толщиной 40 мм.
        Кокосовый лист 30 мм — изготавливается из натуральных волокон кокосового ореха, с добавлением натур­ального латекса для скрепления волокон и придания упругости. Придаёт матрацу
        дополнительную жёсткость.</p>
      HTML
    ]
    manufacturers = Manufacturer.limit(2)
    product_serieses = manufacturers.map{|m| m.product_serieses.limit(5).all}.flatten
    40.times do |i|
      puts "Creating #{i}"
      product_series = product_serieses[i % product_serieses.count]
      Mattress.create({
        title: "#{product_series.title}#{rand(50).to_s}",
        description: array[0],
        short_description: array[1],
        price: 1_500_000 + rand(1_000_000),
        product_series_id: product_series.id,
        image: File.open(Rails.root.join('public/img/img1.png')),
        big_image: File.open(Rails.root.join('public/img/big_img.png')),
      })
    end
  end
end
