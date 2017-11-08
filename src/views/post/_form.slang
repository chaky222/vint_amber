- if post.errors
  ul.errors
  - post.errors.each do |error|
    li = error.to_s

== form(action: "/posts/#{post.id.to_s}", method: post.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "name", value: post.name, placeholder: "Name", class: "form-control")
  div.form-group
  == text_area(name: "body", content: post.body, placeholder: "Body", class: "form-control", size: "30x10")
  div.form-group
  div.checkbox
    == label(:draft)
    == check_box(:draft, checked: post.draft.to_s == "1")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/posts", class: "btn btn-default btn-xs")
