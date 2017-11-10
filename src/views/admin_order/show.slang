p = order.name
p = order.number
p = order.status
p
  == link_to("back", "/orders", class: "btn btn-success btn-xs")
  == link_to("edit", "/orders/#{order.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/orders/#{order.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
