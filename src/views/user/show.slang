p = user.name
p = user.prof_list
p = user.slack_team_id
p = user.slack_name
p
  == link_to("back", "/users", class: "btn btn-success btn-xs")
  == link_to("edit", "/users/#{user.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/users/#{user.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
