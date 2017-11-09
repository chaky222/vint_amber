doctype html
html
  head[lang="ru"]
    meta[http-equiv="Content-Type" content="text/html; charset=utf-8"]
    meta[http-equiv="X-UA-Compatible" content="IE=edge"]
    meta[name="viewport" content="width=device-width, initial-scale=1"]
    link rel="stylesheet" href="/dist/main.bundle.css"
    link rel="stylesheet" href="/dist/main2.bundle.css"

    link[rel="icon" href="/dist/images/n/favicon.png" sizes="16x16" type="image/png"]
    meta[property="og:site_name" content="chaky.patisson-toys.com.ua"]
    meta[name="description" content="chaky.patisson-toys.com.ua - Интернет-магазин игрушек и детских товаров. &#9742; (097) 254-83-34. Бесплатное консультирование покупателей."]
    script[src="./pmain._files/jquery-1.11.3.min.js.Без названия"]
    link[rel="stylesheet" href="./pmain._files/bootstrap.min.css"]
    script[src="./pmain._files/bootstrap.min.js.Без названия"]
    link[rel="stylesheet" href="./pmain._files/jquery.bxslider.min.css"]
    link[href="./pmain._files/screen.css" media="screen, projection" rel="stylesheet" type="text/css"]
    link[href="./pmain._files/print.css" media="print" rel="stylesheet" type="text/css"]
    title
      | Интернет-магазин chaky.patisson-toys.com.ua: игрушки, детские товары, всё для развития ребёнка в Киеве, Украине.
    script[src="./pmain._files/lightbox.js.Без названия"]
    link[href="./pmain._files/lightbox.css" rel="stylesheet"]
    script[type="text/javascript"]
      |  var _gaq = _gaq || []; window.JS_ENV = {}; 
  body
    #layout
      #header
        .navbar_header.guest
          .right_nav_small_panel
            div
              a.header_collapse_btn.visible_guest[href="/#" onclick="openLoginForm();return false;"]
                span.glyphicon.glyphicon-user[aria-hidden="true"]
              a.header_collapse_btn.visible_authorized[href="/#" onclick="return logout();"]
                span.glyphicon.glyphicon-log-out[aria-hidden="true"]
              a.header_collapse_btn.visible_authorized[href="/account"]
                span.glyphicon.glyphicon-cog[aria-hidden="true"]
              a.header_collapse_btn.visible_authorized[href="/client_orders"]
                span.glyphicon.glyphicon-briefcase[aria-hidden="true"]
              label.header_collapse_btn.main_btn[for="top_menu_switcher"]
                span.sr-only
                  | Каталог игрушек
                span.glyphicon.glyphicon-align-justify[aria-hidden="true"]
              a.header_collapse_btn.main_btn[href="/basket"]
                span.glyphicon.glyphicon-shopping-cart[aria-hidden="true"]
            .container-fluid[style="padding-left: 0"]
              .clearfix
                div[style="float: left"]
                  |  044 - xxx - xx - xx 
                div[style="float: right"]
                  |  Пн - Пт 
              .clearfix
                div[style="float: left"]
                  |  097 - xxx - xx - xx 
                div[style="float: right"]
                  |  Сб - Вс 
          a.navbar-brand[href="/"]
            img.logo[src="./pmain._files/logo.png" alt=""]
        input#top_menu_switcher[type="checkbox" style="display:none;"]
        .top-menu.guest
          .item
            a[href="/about"]
              | Кто мы
          .item
            a[href="/articles"]
              | Игрушечные Новости
          .item
            a[hre2f="/director_blog" href="/expert_reviews"]
              | Обзоры экспертов
          .item
            a[href="/action"]
              | Акции
          .item
            a[href="/reference"]
              | Отзывы
          .item
            a[href="/contacts"]
              | Контакты
          .item
            a[href="/delivery"]
              | Доставка и оплата
          .item.right.visible_authorized
            a#logout_link[href="/#" rel="nofollow"]
              | Выход
          .item.right.visible_authorized
            a[href="/account" rel="nofollow"]
              | Настройки
          .item.right.visible_authorized
            a[href="/client_orders" rel="nofollow"]
              | Мои заказы
          .item.icon.right.visible_guest
            a#login_link[href="/#" rel="nofollow"]
              .icon.user[style="display:inline; "] == "&nbsp;" 
              span
                | Вход для пользователей
        .info
          .col.logo
            a[href="/"]
              img.logo_image[src="./pmain._files/logo.png" alt="Интернет-магазин patisson-toys.com.ua" title="Интернет-магазин patisson-toys.com.ua"]
          .wrapper
            .col.call[style="opacity:1;"]
              .title
                | Звоните и пишите нам 
                .line.callback
                  a[href="/feedback" rel="nofollow" onclick="_gaq.push([&#39;_trackEvent&#39;, &#39;Нажатие на кнопку&#39;, &#39;Перезвоните мне&#39;, document.location.pathname]);"]
                    | Перезвоните мне
              .accordion
                ul
                  li[title="Звоните нам на мобильный или по вайберу!"]
                    input.accordion-select[type="radio" name="select" checked=""]
                    .accordion-title
                      span.icon-skype
                        img[src="/dist/images/icons-2/2.png"]
                    .accordion-content
                      span#istat_0.patisson_phone
                        a[href="tel:+380972548334"]
                          sup
                            | (097) 
                          | 254-83-34
                    .accordion-separator
                  li[title="На эту электронную почту можете отправлять свои предложения/замечания."]
                    input.accordion-select[type="radio" name="select"]
                    .accordion-title
                      span.icon-skype
                        img[src="/dist/images/icons-2/3.png"]
                    .accordion-content
                      a[style="margin-left: -50px;font-weight:normal; font-size: 12px;" href="mailto:patisson.toys@gmail.com" rel="nofollow" title="Звоните и пишите нам нам на e-mail!"]
                        | patisson.toys@gmail.com
                    .accordion-separator
                  li[title="Наш скайп - звоните или пишите нам."]
                    input.accordion-select[type="radio" name="select"]
                    .accordion-title
                      span.icon-skype
                        img[src="/dist/images/icons-2/skype.png"]
                    .accordion-content
                      a[href="callto:patisson-toys.com.ua" rel="nofollow" title="Позвоните нам прямо сейчас!"]
                        | patisson-toys.com.ua
                    .accordion-separator
                  li[title="Наш инстаграмм - пишите нам, смотрите обзоры."]
                    input.accordion-select[type="radio" name="select"]
                    .accordion-title
                      span.icon-skype
                        img[src="/dist/images/icons-2/inst.png"]
                    .accordion-content
                      a[style="margin-left: -50px;font-weight:normal; font-size: 11px;" href="https://www.instagram.com/patisson_toys/" rel="nofollow" title="Позвоните нам, смотрите обзоры.!"]
                        | instagram.com/patisson_toys
                    .accordion-separator
                  li[title="Наша группа в Facebook.com: Patisson-toys."]
                    input.accordion-select[type="radio" name="select"]
                    .accordion-title
                      span.icon-skype
                        img[src="/dist/images/icons-2/skype_1801.png"]
                    .accordion-content
                      a[target="_blank" rel="nofollow" href="https://www.facebook.com/Patisson-toys-137455506596252/" title="Оставьте Ваш отзыв в нашей группе в facebook!"]
                        | fb.com/Patisson-toys
                    .accordion-separator
                  li[title="Наша группа в Вконтакте vk.com: patisson.toys."]
                    input.accordion-select[type="radio" name="select"]
                    .accordion-title
                      span.icon-skype
                        img[src="/dist/images/icons-2/vk_group.png"]
                    .accordion-content
                      a[target="_blank" style=" " rel="nofollow" href="https://vk.com/patisson.toys" title="Оставьте Ваш отзыв в Вконтакте о магазине patisson.toys!"]
                        | vk.com/patisson.toys
                    .accordion-separator
                  li[title="Наш канал youtube"]
                    input.accordion-select[type="radio" name="select"]
                    .accordion-title
                      span.icon-skype
                        img[src="/dist/images/icons-2/utube.png"]
                    .accordion-content
                      a[target="_blank" style=" " rel="nofollow" href="https://www.youtube.com/channel/UCVGI5OC5KS17lfTbYQRsqIA" title="Заходите на канал youtube магазина patisson-toys!"]
                        | youtube channel
                    .accordion-separator
            .col.work
              .title
                | Мы работаем
              .line.icon.briefcase
                | Пн-Пт    9:00-18:00
              .line.icon.socks
                | Сб-Вс    Выходные
            #actiosBannerSlider
              .bx-wrapper[style="max-width: 100%;"]
                .bx-viewport[aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 115px;"]
                  ul[style="width: 6215%; position: relative; transition-duration: 0s; transform: translate3d(-590px, 0px, 0px);"]
                    li.bx-clone[style="float: left; list-style: none; position: relative; width: 590px;" aria-hidden="true"]
                      div
                        a[href="/action/konstruktor_magformers_teper_v_ukraine__17"]
                          img.action_banner[style="height:115px;display:block;" src="./pmain._files/29.jpg"]
                    li[style="float: left; list-style: none; position: relative; width: 590px;" aria-hidden="false"]
                      div
                        a[href="/action/aktsija_skazochnyj_domik_dlja_printsessy__21"]
                          img.action_banner[style="height:115px;display:block;" src="./pmain._files/37.jpg"]
                    li[style="float: left; list-style: none; position: relative; width: 590px;" aria-hidden="true"]
                      div
                        a[href="/action/8_marta_tol_ko_dlja_18"]
                          img.action_banner[style="height:115px;display:block;" src="./pmain._files/33.jpg"]
                    li[style="float: left; list-style: none; position: relative; width: 590px;" aria-hidden="true"]
                      div
                        a[href="/action/aktsija_kupi_2_skazki_i_20"]
                          img.action_banner[style="height:115px;display:block;" src="./pmain._files/36.jpg"]
                    li[style="float: left; list-style: none; position: relative; width: 590px;" aria-hidden="true"]
                      div
                        a[href="/action/_25_super_anatomicheskij_komlekt_19"]
                          img.action_banner[style="height:115px;display:block;" src="./pmain._files/32.jpg"]
                    li[style="float: left; list-style: none; position: relative; width: 590px;" aria-hidden="true"]
                      div
                        a[href="/action/aktsija_besplatnaja_dostavka_na_samye_12"]
                          img.action_banner[style="height:115px;display:block;" src="./pmain._files/25.png"]
                    li[style="float: left; list-style: none; position: relative; width: 590px;" aria-hidden="true"]
                      div
                        a[href="/action/konstruktor_magformers_teper_v_ukraine__17"]
                          img.action_banner[style="height:115px;display:block;" src="./pmain._files/29.jpg"]
                    li.bx-clone[style="float: left; list-style: none; position: relative; width: 590px;" aria-hidden="true"]
                      div
                        a[href="/action/aktsija_skazochnyj_domik_dlja_printsessy__21"]
                          img.action_banner[style="height:115px;display:block;" src="./pmain._files/37.jpg"]
                .bx-controls.bx-has-controls-direction.bx-has-pager
                  .bx-controls-direction
                    a.bx-prev[href="/"]
                      | Prev
                    a.bx-next[href="/"]
                      | Next
                  .bx-pager.bx-default-pager
                    .bx-pager-item
                      a.bx-pager-link.active[href="/" data-slide-index="0"]
                        | 1
                    .bx-pager-item
                      a.bx-pager-link[href="/" data-slide-index="1"]
                        | 2
                    .bx-pager-item
                      a.bx-pager-link[href="/" data-slide-index="2"]
                        | 3
                    .bx-pager-item
                      a.bx-pager-link[href="/" data-slide-index="3"]
                        | 4
                    .bx-pager-item
                      a.bx-pager-link[href="/" data-slide-index="4"]
                        | 5
                    .bx-pager-item
                      a.bx-pager-link[href="/" data-slide-index="5"]
                        | 6
          .col.cart.right
            .content
              .title
                | Корзина
              .info-line
                span.number
                  | 0
                |  товаров на сумму 
                span.number
                |  грн
              div[style="text-align:center;"]
                input.order-btn[type="button" value="Корзина" onclick="document.location=&#39;/basket&#39;;"]
        br
        .banners

        .search2
          .background_div
            .search
              form#search_form[action="/product"]
                input#search_input.search-input[type="text" name="search" placeholder="Поиск" value=""]
                input.search-btn[type="submit" value=""]
                input[type="hidden" name="ppp" value=""]
                input[type="hidden" name="ch_from" value="2"]
                input#pr_min[type="hidden" name="pr_min" value="0"]
                input#pr_max[type="hidden" name="pr_max" value="0"]
                input#pcf[type="hidden" name="pcf" value=""]
                input#brand[type="hidden" name="brand" value=""]
        input#main_menu_switcher[type="checkbox" style="display:none;"]
        #main_menu_opener
          label[for="main_menu_switcher"]
            span.menu_opener_label
              | Каталог игрушек
            span.menu_opener_icon
              span.glyphicon.glyphicon-chevron-down[aria-hidden="true"]
        .main-menu.clear
          #main-menu-item1.item.educational_toys
            .icon.educational_toys
              a[href="/product/educational_toys"]
                | Развивающие игрушки
                span
                  |  ▾
            .tab
              .title
                .icon.educational_toys
                  a[href="/product/educational_toys"]
                    | Развивающие игрушки
            .sub-menu
              #sub-menu-item1.wrapper.clear
                .white-stripe
                ul.lvl-1
                  li
                    a[href="/product/educational_toys/constructors"]
                      | Конструкторы
                    ul.lvl-2
                      li
                        a[href="/product/educational_toys/constructors/Magnetic_kit"]
                          | Магнитные конструкторы 
                      li
                        a[href="/product/educational_toys/constructors/Wooden_kit"]
                          | Деревянные конструкторы 
                      li
                        a[href="/product/educational_toys/constructors/LEGO"]
                          | LEGO конструкторы
                      li
                        a[href="/product/educational_toys/constructors/The_designers_of_cardboard"]
                          | Картонные конструкторы
                      li
                        a[href="/product/educational_toys/constructors/Designers_of_iron"]
                          | Конструкторы из металла
                      li
                        a[href="/product/educational_toys/constructors/Designers_of_plastic"]
                          | Конструкторы из пластика
                ul.lvl-1
                  li
                    a[href="/product/educational_toys/research_kits"]
                      | Наука для детей
                    ul.lvl-2
                      li
                        a[href="/product/educational_toys/research_kits/detskie-nauchnye-issledovaniia"]
                          | Наборы для опытов и исследований
                      li
                        a[href="/product/educational_toys/research_kits/4D_puzzle"]
                          | 4D - научные модели
                      li
                        a[href="/product/educational_toys/research_kits/optica_kids"]
                          | Оптика для детей
                ul.lvl-1
                  li
                    a[href="/product/educational_toys/board_games"]
                      | Играем интересные игры
                    ul.lvl-2
                      li
                        a[href="/product/educational_toys/board_games/board_games"]
                          | Настольные игры 
                      li
                        a[href="/product/educational_toys/board_games/puzzles"]
                          | Пазлы
                      li
                        a[href="/product/educational_toys/board_games/magnetic_games"]
                          | Магнитные игры
                      li
                        a[href="/product/educational_toys/board_games/conundrum"]
                          | Головоломки, балансиры
                ul.lvl-1
                  li
                    a[href="/product/educational_toys/dir_3011405"]
                      | Считай и сортируй
                  li
                    a[href="/product/educational_toys/dir_3011419"]
                      | Кегельбаны
                  li
                    a[href="/product/educational_toys/mosaic"]
                      | Мозаика
                  li
                    a[href="/product/educational_toys/kids_optics"]
                      | Сюжетно-ролевые наборы
              .shadow
          #main-menu-item2.item.childrens_creativity
            .icon.childrens_creativity
              a[href="/product/childrens_creativity"]
                | Детское творчество
                span
                  |  ▾
            .tab
              .title
                .icon.childrens_creativity
                  a[href="/product/childrens_creativity"]
                    | Детское творчество
            .sub-menu.horizontal
              #sub-menu-item2.wrapper.clear
                .white-stripe
                ul.lvl-1
                  li
                    a[href="/product/childrens_creativity/dir_3011393"]
                      | Кинетический песок
                  li
                    a[href="/product/childrens_creativity/modeling"]
                      | Массы для лепки, пластилин
                  li
                    a[href="/product/childrens_creativity/dir_3011391"]
                      | Мелки
                  li
                    a[href="/product/childrens_creativity/accessories"]
                      | Аксессуары, песочницы, формы
                  li
                    a[href="/product/childrens_creativity/creativity_kits"]
                      | Наборы для творчества
                  li
                    a[href="/product/childrens_creativity/pencilling"]
                      | Рисование
                  li
                    a[href="/product/childrens_creativity/music"]
                      | Музыка
                  li
                    a[href="/product/childrens_creativity/dir_3011392"]
                      | Оригами, аппликации
                  li
                    a[href="/product/childrens_creativity/stickers"]
                      | Наклейки, штампы
                  li
                    a[href="/product/childrens_creativity/dir_3011406"]
                      | Раскраски
                  li
                    a[href="/product/childrens_creativity/jewelry"]
                      | Детские украшения, рукоделие
                  li
                    a[href="/product/childrens_creativity/office"]
                      | Канцелярия
              .shadow
          #main-menu-item3.item.toys_world
            .icon.toys_world
              a[href="/product/toys_world"]
                | Для малышей
                span
                  |  ▾
            .tab
              .title
                .icon.toys_world
                  a[href="/product/toys_world"]
                    | Для малышей
            .sub-menu.horizontal
              #sub-menu-item3.wrapper.clear
                .white-stripe
                ul.lvl-1
                  li
                    a[href="/product/toys_world/pyramids_sorters"]
                      | Пирамиды, сортеры, кубики
                  li
                    a[href="/product/toys_world/doska-zastezhki"]
                      | Доски - застежки
                  li
                    a[href="/product/toys_world/table_games"]
                      | Настольные игры, пазлы
                  li
                    a[href="/product/toys_world/dir_3011417"]
                      | Первые конструкторы
                  li
                    a[href="/product/toys_world/rattles_rodents"]
                      | Погремушки и грызуны
                  li
                    a[href="/product/toys_world/winders"]
                      | Каталочки
                  li
                    a[href="/product/toys_world/bath_toys"]
                      | Игрушки для ванной
                  li
                    a[href="/product/toys_world/strollers_toys"]
                      | Игрушки для колясок, кроваток
                  li
                    a[href="/product/toys_world/playmats"]
                      | Развивающие коврики
              .shadow
          #main-menu-item4.item
            .icon
              a[href="/product/active_rest"]
                | Активный отдых
                span
                  |  ▾
            .tab
              .title
                .icon
                  a[href="/product/active_rest"]
                    | Активный отдых
            .sub-menu.horizontal
              #sub-menu-item4.wrapper.clear
                .white-stripe
                ul.lvl-1
                  li
                    a[href="/product/active_rest/dir_3011412"]
                      | Все для путешествий 
                  li
                    a[href="/product/active_rest/dir_3011414"]
                      | Прогулочные коляски
                  li
                    a[href="/product/active_rest/dir_3011407"]
                      | Рюкзаки и сумки
                  li
                    a[href="/product/active_rest/in_the_yard"]
                      | Игры на улице
                  li
                    a[href="/product/active_rest/dir_3011390"]
                      | Мыльные пузыри
                  li
                    a[href="/product/active_rest/dir_3011416"]
                      | Полезные аксессуары для прогулок
                  li
                    a[href="/product/active_rest/dir_3011420"]
                      | Одежда для прогулок
              .shadow
          #main-menu-item5.item.soft_toys
            .icon.soft_toys
              a[href="/product/syuzhetno-rolevaya-igra"]
                | Сюжетно-ролевые игры
                span
                  |  ▾
            .tab
              .title
                .icon.soft_toys
                  a[href="/product/syuzhetno-rolevaya-igra"]
                    | Сюжетно-ролевые игры
            .sub-menu.horizontal
              #sub-menu-item5.wrapper.clear
                .white-stripe
                ul.lvl-1
                  li
                    a[href="/product/syuzhetno-rolevaya-igra/detskiy-teatr"]
                      | Кукольный театр 
                  li
                    a[href="/product/syuzhetno-rolevaya-igra/soft_toys"]
                      | Мягкие игрушки
                  li
                    a[href="/product/syuzhetno-rolevaya-igra/dolls"]
                      | Дочки-матери
                  li
                    a[href="/product/syuzhetno-rolevaya-igra/igra-kuhnya"]
                      | Кухня и игрушечная еда
                  li
                    a[href="/product/syuzhetno-rolevaya-igra/detskie-igrovye-domiki"]
                      | Детские игровые домики, мебель
                  li
                    a[href="/product/syuzhetno-rolevaya-igra/heroes"]
                      | Игровые фигурки, герои
                  li
                    a[href="/product/syuzhetno-rolevaya-igra/kostyumy_dlya_karnavala"]
                      | Карнавальные костюмы
              .shadow
          #main-menu-item6.item.cars
            .icon.cars
              a[href="/product/cars"]
                | Машинки и техника 
                span
                  |  ▾
            .tab[style="top: 372px;"]
              .title
                .icon.cars
                  a[href="/product/cars"]
                    | Машинки и техника 
            .sub-menu.horizontal[style="left: 42.5469px; width: 1198px;"]
              #sub-menu-item6.wrapper.clear
                .white-stripe
                ul.lvl-1
                  li
                    a[href="/product/cars/cars"]
                      | Машинки, самолеты, вертолеты
                  li
                    a[href="/product/cars/railways"]
                      | Железные дороги, поезда
                  li
                    a[href="/product/cars/dir_3011421"]
                      | Беговелы, самокаты
                  li
                    a[href="/product/cars/transformers"]
                      | Роботы, трансформеры
                  li
                    a[href="/product/cars/radio_toys"]
                      | Радиоуправляемые игрушки
                  li
                    a[href="/product/cars/dir_3011397"]
                      | Детское оружие
              .shadow
          #main-menu-item7.item.books
            .icon.books
              a[href="/product/books"]
                | Книжная полка
                span
                  |  ▾
            .tab
              .title
                .icon.books
                  a[href="/product/books"]
                    | Книжная полка
            .sub-menu.horizontal
              #sub-menu-item7.wrapper.clear
                .white-stripe
                ul.lvl-1
                  li
                    a[href="/product/books/encyclopedia"]
                      | Детские энциклопедии
                  li
                    a[href="/product/books/cognitive"]
                      | Познавательная литература
                  li
                    a[href="/product/books/dir_3011411"]
                      | Книги-картинки, виммельбухи
                  li
                    a[href="/product/books/dir_3011415"]
                      | Азбуки, буквари, учебная литература
                  li
                    a[href="/product/books/fiction"]
                      | Художественная литература
                  li
                    a[href="/product/books/training_aids"]
                      | Развивающие пособия и карточки
                  li
                    a[href="/product/books/dir_3011408"]
                      | Книги с наклейками
                  li
                    a[href="/product/books/for_parents"]
                      | Книги для родителей
              .shadow
          #main-menu-item8.item.childs_room
            .icon.childs_room
              a[href="/product/childs_room"]
                | Детская комната
                span
                  |  ▾
            .tab
              .title
                .icon.childs_room
                  a[href="/product/childs_room"]
                    | Детская комната
            .sub-menu.horizontal
              #sub-menu-item8.wrapper.clear
                .white-stripe
                ul.lvl-1
                  li
                    a[href="/product/childs_room/toys_storing"]
                      | Хранение вещей, игрушек
                  li
                    a[href="/product/childs_room/tents"]
                      | Шатры, домики, качели
                  li
                    a[href="/product/childs_room/lamps"]
                      | Ночники, светильники
                  li
                    a[href="/product/childs_room/dir_3011413"]
                      | Мебель в детскую
                  li
                    a[href="/product/childs_room/walls_stickers"]
                      | Стикеры для стен
                  li
                    a[href="/product/childs_room/stadiometers"]
                      | Ростомеры
                  li
                    a[href="/product/childs_room/bedding"]
                      | Постельные принадлежности
                  li
                    a[href="/product/childs_room/dir_3011402"]
                      | Hand-made для детской
                  li
                    a[href="/product/childs_room/dishes"]
                      | Детская посуда
                  li
                    a[href="/product/childs_room/decoration"]
                      | Декор
              .shadow
          #main-menu-item9.item.for_mums
            .icon.for_mums
              a[href="/product/for_mums"]
                | Для мам
                span
                  |  ▾
            .tab
              .title
                .icon.for_mums
                  a[href="/product/for_mums"]
                    | Для мам
            .sub-menu.horizontal
              #sub-menu-item9.wrapper.clear
                .white-stripe
                ul.lvl-1
                  li
                    a[href="/product/for_mums/wheelchairs_bags"]
                      | Сумочки для колясок
                  li
                    a[href="/product/for_mums/slings"]
                      | Переноски, слинги
                  li
                    a[href="/product/for_mums/cosmetics"]
                      | Косметика для мам
              .shadow
          #main-menu-item10.item
            .icon
              a[href="/product/sale"]
                | %SALE!
                span
                  |  ▾
      #content
        .breadcrumbs[xmlns:v="http://rdf.data-vocabulary.org/#"]
          span[typeof="v:Breadcrumb"]
            a[href="/product" rel="v:url" property="v:title"]
              | Каталог
        .product-catalog
          h1
            | Каталог
          .sections
            .row
              .item.col-lg-2.col-md-3.col-sm-4.col-xs-6
                a[href="/product/educational_toys"]

                .icon-bg
                  .icon-48.educational_toys
                .title
                  a[href="/product/educational_toys"]
                    | Развивающие игрушки
                li
                  a[href="/product/educational_toys/constructors"]
                    | Конструкторы
                li
                  a[href="/product/educational_toys/research_kits"]
                    | Наука для детей
                li
                  a[href="/product/educational_toys/dir_3011405"]
                    | Считай и сортируй
                li
                  a[href="/product/educational_toys/dir_3011419"]
                    | Кегельбаны
                li
                  a[href="/product/educational_toys/board_games"]
                    | Играем интересные игры
                li
                  a[href="/product/educational_toys/mosaic"]
                    | Мозаика
                li.hidden
                  a[href="/product/educational_toys/kids_optics"]
                    | Сюжетно-ролевые наборы
              .item.col-lg-2.col-md-3.col-sm-4.col-xs-6
                a[href="/product/childrens_creativity"]

                .icon-bg
                  .icon-48.childrens_creativity
                .title
                  a[href="/product/childrens_creativity"]
                    | Детское творчество
                li
                  a[href="/product/childrens_creativity/dir_3011393"]
                    | Кинетический песок
                li
                  a[href="/product/childrens_creativity/modeling"]
                    | Массы для лепки, пластилин
                li
                  a[href="/product/childrens_creativity/dir_3011391"]
                    | Мелки
                li
                  a[href="/product/childrens_creativity/accessories"]
                    | Аксессуары, песочницы, формы
                li
                  a[href="/product/childrens_creativity/creativity_kits"]
                    | Наборы для творчества
                li
                  a[href="/product/childrens_creativity/pencilling"]
                    | Рисование
                li.hidden
                  a[href="/product/childrens_creativity/music"]
                    | Музыка
                li.hidden
                  a[href="/product/childrens_creativity/dir_3011392"]
                    | Оригами, аппликации
                li.hidden
                  a[href="/product/childrens_creativity/stickers"]
                    | Наклейки, штампы
                li.hidden
                  a[href="/product/childrens_creativity/dir_3011406"]
                    | Раскраски
                li.hidden
                  a[href="/product/childrens_creativity/jewelry"]
                    | Детские украшения, рукоделие
                li.hidden
                  a[href="/product/childrens_creativity/office"]
                    | Канцелярия
              .item.col-lg-2.col-md-3.col-sm-4.col-xs-6
                a[href="/product/toys_world"]

                .icon-bg
                  .icon-48.toys_world
                .title
                  a[href="/product/toys_world"]
                    | Для малышей
                li
                  a[href="/product/toys_world/pyramids_sorters"]
                    | Пирамиды, сортеры, кубики
                li
                  a[href="/product/toys_world/doska-zastezhki"]
                    | Доски - застежки
                li
                  a[href="/product/toys_world/table_games"]
                    | Настольные игры, пазлы
                li
                  a[href="/product/toys_world/dir_3011417"]
                    | Первые конструкторы
                li
                  a[href="/product/toys_world/rattles_rodents"]
                    | Погремушки и грызуны
                li
                  a[href="/product/toys_world/winders"]
                    | Каталочки
                li.hidden
                  a[href="/product/toys_world/bath_toys"]
                    | Игрушки для ванной
                li.hidden
                  a[href="/product/toys_world/strollers_toys"]
                    | Игрушки для колясок, кроваток
                li.hidden
                  a[href="/product/toys_world/playmats"]
                    | Развивающие коврики
              .item.col-lg-2.col-md-3.col-sm-4.col-xs-6
                .a_image
                  .img
                    .sub-img
                      a[href="/product/active_rest"]
                        img[src="./pmain._files/bg-product-catalog-section-icon.png" alt=""]
                .title
                  a[href="/product/active_rest"]
                    | Активный отдых
                li
                  a[href="/product/active_rest/dir_3011412"]
                    | Все для путешествий 
                li
                  a[href="/product/active_rest/dir_3011414"]
                    | Прогулочные коляски
                li
                  a[href="/product/active_rest/dir_3011407"]
                    | Рюкзаки и сумки
                li
                  a[href="/product/active_rest/in_the_yard"]
                    | Игры на улице
                li
                  a[href="/product/active_rest/dir_3011390"]
                    | Мыльные пузыри
                li
                  a[href="/product/active_rest/dir_3011416"]
                    | Полезные аксессуары для прогулок
                li.hidden
                  a[href="/product/active_rest/dir_3011420"]
                    | Одежда для прогулок
              .item.col-lg-2.col-md-3.col-sm-4.col-xs-6
                a[href="/product/syuzhetno-rolevaya-igra"]

                .icon-bg
                  .icon-48.soft_toys
                .title
                  a[href="/product/syuzhetno-rolevaya-igra"]
                    | Сюжетно-ролевые игры
                li
                  a[href="/product/syuzhetno-rolevaya-igra/detskiy-teatr"]
                    | Кукольный театр 
                li
                  a[href="/product/syuzhetno-rolevaya-igra/soft_toys"]
                    | Мягкие игрушки
                li
                  a[href="/product/syuzhetno-rolevaya-igra/dolls"]
                    | Дочки-матери
                li
                  a[href="/product/syuzhetno-rolevaya-igra/igra-kuhnya"]
                    | Кухня и игрушечная еда
                li
                  a[href="/product/syuzhetno-rolevaya-igra/detskie-igrovye-domiki"]
                    | Детские игровые домики, мебель
                li
                  a[href="/product/syuzhetno-rolevaya-igra/heroes"]
                    | Игровые фигурки, герои
                li.hidden
                  a[href="/product/syuzhetno-rolevaya-igra/kostyumy_dlya_karnavala"]
                    | Карнавальные костюмы
              .item.col-lg-2.col-md-3.col-sm-4.col-xs-6
                a[href="/product/cars"]

                .icon-bg
                  .icon-48.cars
                .title
                  a[href="/product/cars"]
                    | Машинки и техника 
                li
                  a[href="/product/cars/cars"]
                    | Машинки, самолеты, вертолеты
                li
                  a[href="/product/cars/railways"]
                    | Железные дороги, поезда
                li
                  a[href="/product/cars/dir_3011421"]
                    | Беговелы, самокаты
                li
                  a[href="/product/cars/transformers"]
                    | Роботы, трансформеры
                li
                  a[href="/product/cars/radio_toys"]
                    | Радиоуправляемые игрушки
                li
                  a[href="/product/cars/dir_3011397"]
                    | Детское оружие
              .item.col-lg-2.col-md-3.col-sm-4.col-xs-6
                a[href="/product/books"]

                .icon-bg
                  .icon-48.books
                .title
                  a[href="/product/books"]
                    | Книжная полка
                li
                  a[href="/product/books/encyclopedia"]
                    | Детские энциклопедии
                li
                  a[href="/product/books/cognitive"]
                    | Познавательная литература
                li
                  a[href="/product/books/dir_3011411"]
                    | Книги-картинки, виммельбухи
                li
                  a[href="/product/books/dir_3011415"]
                    | Азбуки, буквари, учебная литература
                li
                  a[href="/product/books/fiction"]
                    | Художественная литература
                li
                  a[href="/product/books/training_aids"]
                    | Развивающие пособия и карточки
                li.hidden
                  a[href="/product/books/dir_3011408"]
                    | Книги с наклейками
                li.hidden
                  a[href="/product/books/for_parents"]
                    | Книги для родителей
              .item.col-lg-2.col-md-3.col-sm-4.col-xs-6
                a[href="/product/childs_room"]

                .icon-bg
                  .icon-48.childs_room
                .title
                  a[href="/product/childs_room"]
                    | Детская комната
                li
                  a[href="/product/childs_room/toys_storing"]
                    | Хранение вещей, игрушек
                li
                  a[href="/product/childs_room/tents"]
                    | Шатры, домики, качели
                li
                  a[href="/product/childs_room/lamps"]
                    | Ночники, светильники
                li
                  a[href="/product/childs_room/dir_3011413"]
                    | Мебель в детскую
                li
                  a[href="/product/childs_room/walls_stickers"]
                    | Стикеры для стен
                li
                  a[href="/product/childs_room/stadiometers"]
                    | Ростомеры
                li.hidden
                  a[href="/product/childs_room/bedding"]
                    | Постельные принадлежности
                li.hidden
                  a[href="/product/childs_room/dir_3011402"]
                    | Hand-made для детской
                li.hidden
                  a[href="/product/childs_room/dishes"]
                    | Детская посуда
                li.hidden
                  a[href="/product/childs_room/decoration"]
                    | Декор
              .item.col-lg-2.col-md-3.col-sm-4.col-xs-6
                a[href="/product/for_mums"]

                .icon-bg
                  .icon-48.for_mums
                .title
                  a[href="/product/for_mums"]
                    | Для мам
                li
                  a[href="/product/for_mums/wheelchairs_bags"]
                    | Сумочки для колясок
                li
                  a[href="/product/for_mums/slings"]
                    | Переноски, слинги
                li
                  a[href="/product/for_mums/cosmetics"]
                    | Косметика для мам
              .item.col-lg-2.col-md-3.col-sm-4.col-xs-6
                .a_image
                  .img
                    .sub-img
                      a[href="/product/sale"]
                        img[src="./pmain._files/bg-product-catalog-section-icon.png" alt=""]
                .title
                  a[href="/product/sale"]
                    | %SALE!
            .brace
              .left
              .center
                img.centered_button[src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAQAAABQ+cdNAAAAAXNSR0IArs4c6QAAAAJiS0dEAP+Hj8y/AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH3wQQDAoahLIdkQAAAFtJREFUCNc1za0KAlEURtF10BHEaNEkTPP9H0UmWAThNsHoz4DzGUZ33GXVKVu7KnNxy129tTwca4GPczb2JaJlyGQypCWiAq5Z4+lQ+M/RJfS1AssZ6LzQ/bgvkC4jPr0aP2sAAAAASUVORK5CYII=" alt=""]
              .right
            .show-all-btn
              | Все разделы
        div.col-sm-12.main
          == content
        .special-offers
          .title
        .about-block
          .title
            | Интернет-магазин «Patisson-toys.com.ua»
          .text
            |  Мы предлагаем не просто играть, а делать это весело, познавательно и увлекательно! Мы ищем самые интересные игрушки для детей от 0 до 99 лет, потому что уверены, что играть можно в любом возрасте! Для любителей коллекционировать у нас есть необыкновенные 4D пазлы от 4D Master, почитателям прелестных ангелочков предлагаем Sonny Angel, поклонники игр-головоломок могут попробовать себя в сборке пазлов EuroGraphics и мозаики Hama. А те, кто любит необычные наборы для рисования, пазлы и игрушки - обратите свое внимание на Djeco и Janod. Для поклонников деревянных эко-игрушек - мы нашли необыкновенные Grimms, Melissa&Doug, GOKI, HAPE, HAME. Если ваш ребенок любит рисовать, то мы готовы его удивить самыми интересными карандашами, мелками, наборами для творчества от ALEX Toys, Crayon Rocks, Crazy Crayons. Кто не мыслит свой досуг без сборки пары-тройки интересных моделей, могут приобрести конструктор Engino. Да, у нас очень много других любопытных игр, игрушек, развивалок..... :) Присоединяйтесь!! Будет весело!
        .about-block
          .col-xs-12.social.text-center
            ul.list-inline
              li[title="Звоните нам на мобильный или по вайберу!"]
                span#istat_3.patisson_phone
                  a[href="tel:+380972548334"]
                    img[src="./pmain._files/viber.png" alt="Звоните нам на мобильный или по вайберу!"]
              li
                a[title="На эту электронную почту можете отправлять свои предложения/замечания." href="mailto:patisson.toys@gmail.com" rel="nofollow"]
                  img[src="./pmain._files/mail.png" alt=""]
              li
                a[title="Наш скайп - звоните или пишите нам." href="callto:patisson-toys.com.ua" rel="nofollow"]
                  img[src="./pmain._files/skype(1).png" alt=""]
              li
                a[href="https://www.instagram.com/patisson_toys/" rel="nofollow" target="_blank" title="Позвоните нам, смотрите обзоры.!"]
                  img[src="./pmain._files/inst(1).png" alt=""]
              li
                a[title="Наша группа в Facebook.com: Patisson-toys." target="_blank" rel="nofollow" href="https://www.facebook.com/Patisson-toys-137455506596252/"]
                  img[src="./pmain._files/facebook.png" alt=""]
              li
                a[target="_blank" style=" " rel="nofollow" href="https://vk.com/patisson.toys" title="Оставьте Ваш отзыв в Вконтакте о магазине patisson.toys!"]
                  img[src="./pmain._files/vk.png" alt=""]
              li
                a[target="_blank" style=" " rel="nofollow" href="https://www.youtube.com/channel/UCVGI5OC5KS17lfTbYQRsqIA" title="Заходите на канал youtube магазина patisson-toys!"]
                  img[src="./pmain._files/utube(1).png" alt=""]
          .text
            | Доставка товаров в следующие города: Киев, Харьков, Одесса, Львов, Днепропетровск, Николаев, Полтава, Ровно, Сумы, Тернополь, Ивано-Франковск, Кировоград, Херсон, Хмельницкий, Черкассы, Чернигов, Черновцы, Винница, Луцк, Житомир, Запорожье, Ужгород.
      #footer
        .col.copyright
          |  © Patisson-toys 2015-
          span#current_year
            | 2017
          script[type="text/javascript"]
            |  var cur = new Date(); document.getElementById('current_year').innerHTML = cur.getFullYear(); 
        .wrapper
          .col.call
            .title
              | Звоните
            #phone_footer.line.icon.phone
              a[href="tel:+380972548334"]
                sup
                  | (097) 
                | 254-83-34
            .line.callback
              a[href="/feedback" rel="nofollow" onclick="_gaq.push([&#39;_trackEvent&#39;, &#39;Нажатие на кнопку&#39;, &#39;Перезвоните мне&#39;, document.location.pathname]);"]
                | Перезвоните мне
          .col.work
            .title
              | Мы работаем
            .line.icon.briefcase
              | Пн-Пт    9:00-18:00
            .line.icon.socks
              | Сб-Вс    Выходные
          .col.write
            .title
              | Пишите
            .line.icon.skype
              a[href="callto:patisson-toys.com.ua" rel="nofollow" onclick="_gaq.push([&#39;_trackEvent&#39;, &#39;Нажатие на кнопку&#39;, &#39;Skype&#39;, document.location.pathname]);"]
                | patisson-toys.com.ua
            .line.icon.siteheart
              a[href="mailto:patisson.toys@gmail.com" rel="nofollow"]
                | patisson.toys@gmail.com
        .col.social.right
          .content
            div[style="width:90px;margin-right:15px;float:left;display:none;"]
              br
              a[style="vertical-align:top" href="/webmoney" target="_blank"]
                img[src="./pmain._files/88x31_wm_blue_on_white_ru.png" alt="Оплата через WebMoney" border="0"]
              br
              br
              a[style="vertical-align:top" target="_blank"]
                img[src="./pmain._files/88x31_wm_v_blue_on_white_ru.png" title="Здесь находится аттестат нашего WM идентификатора 688428902869" border="0"]
            div[style="width:100px;float:left"]
              br
              a[style="vertical-align:top" href="http://www.bigmir.net/" target="_blank" onclick="img = new Image();img.src=&quot;http://www.bigmir.net/?cl=136270&quot;;"]
              br
              br
    #blur
    #login_form
      .error_msg
      .close-btn
      .clear-both
      .content
        .subtitle
          | Вход для клиентов:
        input#lform_email[type="text" placeholder="E-mail" value=""]
        br
        input#lform_password[type="password" placeholder="пароль"]
        div[style="float:left;"]
          a[href="/login?do=restore"]
            | Забыли пароль
        div[style="float:right;"]
          a[href="/registration"]
            | Зарегистрироваться
        .clear-both
        input#login_btn[type="button" value="Войти"]
    script[type="text/javascript" src="./pmain._files/plugins.min.js.Без названия"]
    script[type="text/javascript" src="./pmain._files/jquery.bxslider.js.Без названия"]
    script[type="text/javascript" src="./pmain._files/jquery.maskedinput.min.js.Без названия"]
    script[type="text/javascript" src="./pmain._files/scripts.min.js.Без названия"]
    #lightboxOverlay.lightboxOverlay[style="display: none;"]
    #lightbox.lightbox[style="display: none;"]
      .lb-outerContainer
        .lb-container
          img.lb-image[src="/"]
          .lb-nav
            a.lb-prev[href="/"]
            a.lb-next[href="/"]
          .lb-loader
            a.lb-cancel
      .lb-dataContainer
        .lb-data
          .lb-details
            span.lb-caption
            span.lb-number
          .lb-closeContainer
            a.lb-close

    script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"
    script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    script src="/dist/main.bundle.js"
    div.col-xs-12.well.stats style="text-align:center;"
      = "Made by "
      a href="https://github.com/chaky222" chaky
      = "Complate in #{Amber::Pipe::Logger.elapsed_text(Time.now - context.time_start)} + 0.05ms - 0.1ms"
