- if user.errors
  ul.errors
  - user.errors.each do |error|
    li = error.to_s

== form(action: "/users/#{user.id.to_s}", method: user.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "name", value: user.name, placeholder: "Name", class: "form-control")
  div.form-group
  == text_field(name: "prof_list", value: user.prof_list, placeholder: "Prof_list", class: "form-control")
  div.form-group
  == text_field(name: "slack_team_id", value: user.slack_team_id, placeholder: "Slack_team_id", class: "form-control")
  div.form-group
  == text_field(name: "slack_name", value: user.slack_name, placeholder: "Slack_name", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/users", class: "btn btn-default btn-xs")
