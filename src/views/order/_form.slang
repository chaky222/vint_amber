- if order.errors
  ul.errors
  - order.errors.each do |error|
    li = error.to_s

== form(action: "/orders/#{order.id.to_s}", method: order.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "name", value: order.name, placeholder: "Name", class: "form-control")
  div.form-group
  == text_field(name: "number", value: order.number, placeholder: "Number", class: "form-control")
  div.form-group
  == text_field(name: "status", value: order.status, placeholder: "Status", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/orders", class: "btn btn-default btn-xs")
