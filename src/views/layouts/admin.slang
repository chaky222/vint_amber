doctype html
html
  head
    title a - Заказы Lite
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"
    link href="/style/a_main_menu.css" rel="stylesheet" type="text/css"
    link rel="stylesheet" href="/style/jquery-ui.css"
    link href="/style/admin.css?v=1" rel="stylesheet" type="text/css"
    link href="/style/bootstrap.css" type="text/css" rel="stylesheet"
    link rel="stylesheet" type="text/css" href="/style/daterangepicker-bs3.css"
    link rel="stylesheet" href="/style/select2.min.css"
    link rel="stylesheet" href="/style/select2-bootstrap.css"
    

    script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"
    script type="text/javascript" src="/jquery/jquery.tablesorter.js"
    script type="text/javascript" src="/js/admin/a_main_menu.js?v=1" charset="cp1251"
    script src="/js/bootstrap.js"
    script src="/js/jquery-ui.1.11.3.min.js"
    script type="text/javascript" src="/js/moment.js"
    script type="text/javascript" src="/js/daterangepicker.js"
    script type="text/javascript" src="/js/select2.full.js"
  body
    div.col-xs-12 style="height: 80px;"
      == File.read("#{Amber::Settings.site_htdocs}/cgi-bin/admin/files/admin_menu/#{context.data[:user_id].to_s}.html", "CP1251", :skip)
    div.col-xs-12
      div id="search_time_block" == "Рождено за <b id='search_val'> #{Amber::Pipe::Logger.elapsed_text(Time.now - context.time_start)}"
    div.col-xs-12
      div.row
      - flash.each do |key, value|
        div class="alert alert-#{ key }"
          p = flash[key]
      div.row
        div.col-sm-12.main
          == content

    
    /script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    
    script src="/dist/main.bundle.js"
    br
    br
