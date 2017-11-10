div.row
  div.col-sm-11
    h2 Users
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/users/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Prof_list
        th Slack_team_id
        th Slack_name
        th Actions
    tbody
    - users.each do |user|
      tr
        td = user.name
        td = user.prof_list
        td = user.slack_team_id
        td = user.slack_name
        td
          span
            == link_to("read", "/users/#{user.id}", class: "btn btn-success btn-xs")
            == link_to("edit", "/users/#{user.id}/edit", class: "btn btn-success btn-xs")
            == link_to("delete", "/users/#{ user.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
