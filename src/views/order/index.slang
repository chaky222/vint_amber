div.row
  div.col-sm-11
    h2 Orders
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/orders/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Number
        th Status
        th Actions
    tbody
    - orders.each do |order|
      tr
        td = order.name
        td = order.number
        td = order.status
        td
          span
            == link_to("read", "/orders/#{order.id}", class: "btn btn-success btn-xs")
            == link_to("edit", "/orders/#{order.id}/edit", class: "btn btn-success btn-xs")
            == link_to("delete", "/orders/#{ order.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
