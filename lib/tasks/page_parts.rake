# encoding: UTF-8
namespace :page_parts do
  desc 'update or create default page parts'
  task :update => :environment do
    [
      [:phones_header, 'Телефоны в заголовке', <<-HTML],
        <div class="contacts">
            <p>Звоните нам</p>
            <div>
                <p class="velcom"><span>+375</span> 29 645-16-48</p>
                <p class="mts"><span>+375</span> 33 301-28-36</p>
                <p class="velcom"><span>+375</span> 29 654-67-34</p>
            </div>
        </div>
      HTML
      [:phones_footer, 'Контакты внизу', <<-HTML],
        <div class="contacts">
            <div class="skype">Скайп: <a href="mailto:example">Matraskinby</a></div>
            <div class="email">Почта: <a href="mailto:example">info@matraskin.by</a></div>
            <div class="phones">
                <p><em>+375</em> 29 645-16-48 <span>Velcom</span></p>
                <p><em>+375</em> 29 654-67-34 <span>Velcom</span></p>
                <p><em>+375</em> 33 301-28-36 <span>МТС</span></p>
            </div>
        </div>
        HTML
      [:copyright, 'Копирайт', <<-HTML],
        <div class="copy">© 2012 <a href="#">«Матраскин»</a></div>
      HTML
      [:banner, 'Баннер', <<-HTML],
          <div class="banner">
            <div class="text">
                <h3>Кот Матраскин знает все про</h3>

                <h1>Здоровый и комфортный сон</h1>

                <p>И для того чтобы быть успешным, здоровым, счастливым и всегда пребывать в прекрасном расположении духа, необходимо отдыхать.</p>

                <div class="btn"><a href="#">Выбор Матраскина</a></div>
            </div>
            <div class="pic">
                <img src="img/banner_pic.png">
            </div>
        </div>
      HTML
      [:about, 'О магазине', <<-HTML],
        about shop
      HTML
      [:contact_info, 'Контактная информация', <<-HTML],
        contact info
      HTML
      [:payment_and_delivery, 'Оплата и доставка', <<-HTML],
        payment/delivery
      HTML
      [:how_to, 'Как правильно подобрать матрас?', %{
        <h3>Главный принцип компании — предоставить широкому кругу<br> потребителей качественную и продукцию по доступной цене.</h3>
        <p>Мы сотрудничаем с производителями из Европы, изготавливающими комплектующие для матрасов и мягкой мебели. Долгосрочность сотрудничество гарантирует нам, а соответственно, и нашему потребителю, высокое
            качество продукции, а также стабильность и своевременность поставок. Все комплектующие производятся на современном оборудовании с использованием передовых технологий, соответствующих самым высоким
            стандартам качества.</p>
      }, <<-HTML]
        <div class="desc">
          <h2>Как правильно подобрать матрас?</h2>
          <h3>Главный принцип компании — предоставить широкому кругу<br> потребителей качественную и продукцию по доступной цене.</h3>
          <p>Мы сотрудничаем с производителями из Европы, изготавливающими комплектующие для матрасов и мягкой мебели. Долгосрочность сотрудничество гарантирует нам, а соответственно, и нашему потребителю, высокое
            качество продукции, а также стабильность и своевременность поставок. Все комплектующие производятся на современном оборудовании с использованием передовых технологий, соответствующих самым высоким
            стандартам качества.</p>
          <a href="/pages/9">Узнать больше</a>
        </div>
        <div class="pics">
          <img src="/img/pic1.png">
          <img src="/img/pic2.png">
        </div>
      HTML

    ].each do |array|
      puts "Updating #{array.first}"
      page_part = PagePart.find_or_create_by_key("#{array[0]}")
      page_part.update_attributes(title: array[1], content: array[2], intro: array[3])
    end
  end
end
