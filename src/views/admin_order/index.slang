link rel="stylesheet" href="/style/o_lite.css"
div.col-xs-12 style="margin-top: -10px;"
  div id="order_header" align="left"
    font size="4"
      b == "Заказы Lite"

div.col-xs-12.well.filters_block
  form.load_by_ajax_form id="load_by_ajax_form_lite" content_selector=".main_text_div" methd="get" action="/cgi-bin/admins/orders?"
    div.col-xs-12
      input onchange="date_range_changed();" id="date_range" name="date_range" value="#{period.to_s}" size="25" type="text" style="width:200px;max-width:200px;" title="Выбор периода, за который отображать заказы."
      div.select2_manager_chooser
        select.form-control.select2-multiple name="managers" multiple="multiple" data-placeholder="Managers" title="Манагеры" onchange="$(this).closest('form').submit();"
          == self.class.options_for_select([["Любой", "any"], ["Нихто", "0"]] + managers.map { |x| [x.name, x.id.to_s] }, manager_list)
      div.select2_statuses_chooser
        select class="form-control select2-multiple" name="statuses" multiple="multiple" data-placeholder="Managers" title="Статусы" onchange="$(this).closest('form').submit();"
          == "{status_list}"
      input type="submit" title="Применить фильтры"
div.col-xs-12.main_text_div
  == "#{main_text}"
script type="text/javascript" src="/js/admin/o_lite.js"