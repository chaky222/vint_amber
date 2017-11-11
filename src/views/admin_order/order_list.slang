table class="order_list_table"
  thead
    tr
      th
      th == "№"
      th == "Имя"
      th title="Закупщик/координатор, который прикреплен к заказу." == "Курьер"
      th == "Склады-0"
      th == "Реклама"
      th == "Манагер"
      th == "Сумма"
      th == "Прибыль"
      th == "За доставку"
      th width="100" == "&nbsp;"
  tbody
    == "#{data[:order_list_rows]}"
